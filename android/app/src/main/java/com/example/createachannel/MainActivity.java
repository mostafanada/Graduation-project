package com.example.createachannel;

import android.Manifest;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.media.AudioRecord;
import android.os.Bundle;

import androidx.annotation.NonNull;

import org.tensorflow.lite.support.audio.TensorAudio;
import org.tensorflow.lite.support.label.Category;
import org.tensorflow.lite.task.audio.classifier.AudioClassifier;
import org.tensorflow.lite.task.audio.classifier.Classifications;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;

public class MainActivity extends FlutterActivity {
    private EventSink events;
    private Configuration oldConfig;
    public final static int REQUEST_RECORD_AUDIO = 2033;

    String modelPath = "lite-model_yamnet_classification_tflite_1.tflite";
    float probabilityThreshold = 0.3f;
    AudioClassifier classifier;
    TensorAudio tensor;
    AudioRecord record;
    TimerTask timerTask;
    String finalOutput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        loadModel();
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        EventChannel eventChannel = new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "example.com/channel");
        eventChannel.setStreamHandler(new StreamHandler() {
            @Override
            public void onListen(Object arguments, EventSink eventSink) {
                events = eventSink;
                events.success(finalOutput);
            }

            @Override
            public void onCancel(Object arguments) {
                events = null; // Reset the EventSink when canceled
            }
        });
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (events != null) {
            events.success(finalOutput); // Send the current finalOutput to Flutter
        }
    }

    private boolean isDarkModeConfigUpdated(Configuration config) {
        return (config.diff(oldConfig) & ActivityInfo.CONFIG_UI_MODE) != 0
                && isDarkMode(config) != isDarkMode(oldConfig);
    }

    private boolean isDarkMode(Configuration config) {
        return (config.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    public void loadModel() {
        if (checkSelfPermission(Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO}, REQUEST_RECORD_AUDIO);
        }

        try {
            classifier = AudioClassifier.createFromFile(this, modelPath);
        } catch (IOException e) {
            e.printStackTrace();
        }

        tensor = classifier.createInputTensorAudio();
        record = classifier.createAudioRecord();
        record.startRecording();
        TensorAudio.TensorAudioFormat format = classifier.getRequiredTensorAudioFormat();

        timerTask = new TimerTask() {
            public void run() {
                int numberOfSamples = tensor.load(record);
                List<Classifications> output = classifier.classify(tensor);

                List<Category> finalOutputList = new ArrayList<>();

                for (Classifications classifications : output) {
                    for (Category category : classifications.getCategories()) {
                        if (category.getScore() > probabilityThreshold) {
                            finalOutputList.add(category);
                        }
                    }
                }

                finalOutputList.sort((o1, o2) -> Float.compare(o2.getScore(), o1.getScore()));

                StringBuilder outputStr = new StringBuilder();
                for (Category category : finalOutputList) {
                    outputStr.append(category.getLabel())
                            .append(": ").append(category.getScore()).append("\n");
                }

                if (finalOutputList.isEmpty()) {
                    finalOutput = "Could not classify";
                } else {
                    finalOutput = outputStr.toString();
                }

                updateFinalOutput(finalOutput);
            }
        };

        new Timer().scheduleAtFixedRate(timerTask, 1, 1000);
    }

    private void updateFinalOutput(String output) {
        runOnUiThread(() -> {
            if (events != null) {
                events.success(output); // Send the updated finalOutput to Flutter
            }
        });
    }
}
