package com.example.createachannel;
import org.tensorflow.lite.support.label.Category;
import org.tensorflow.lite.task.audio.classifier.AudioClassifier;
import org.tensorflow.lite.task.audio.classifier.Classifications;
import org.tensorflow.lite.support.audio.TensorAudio;
import org.tensorflow.lite.task.core.BaseOptions;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.Manifest;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.icu.text.BidiClassifier;
import android.media.AudioRecord;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.dev/battery";
    public final static int REQUEST_RECORD_AUDIO = 2033;

    String modelPath = "lite-model_yamnet_classification_tflite_1.tflite";
    float probabilityThreshold = 0.3f;
    AudioClassifier classifier;
    TensorAudio tensor;
    AudioRecord record;
    TimerTask timerTask;
    String finalout;
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // This method is invoked on the main thread.
//                            if (call.method.equals("getBatteryLevel")) {
//                                int batteryLevel = getBatteryLevel();
//
//                                if (batteryLevel != -1) {
//                                    result.success(batteryLevel);
//                                } else {
//                                    result.error("UNAVAILABLE", "Battery level not available.", null);
//                                }
//                            }
                            if (call.method.equals("startRecording")) {

                                result.success(loadModel());
                            } else if(call.method.equals("stopRecording"))
                            {
                                onStopRecording();
                            }
                            else {
                                result.notImplemented();
                            }
                        }
                );
    }
    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }
    public String loadModel() {
        if (checkSelfPermission(Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO}, REQUEST_RECORD_AUDIO);


        }

        try {
            classifier = AudioClassifier.createFromFile(this, modelPath);
        } catch (IOException e) {
            e.printStackTrace();
            return "Failed to initialize classifier";
        }

        tensor = classifier.createInputTensorAudio();
        record = classifier.createAudioRecord();
        record.startRecording();
        TensorAudio.TensorAudioFormat format = classifier.getRequiredTensorAudioFormat();

        timerTask = new TimerTask() {
            public void run() {
                int numberOfSamples = tensor.load(record);
                List<Classifications> output = classifier.classify(tensor);

                List<Category> finalOutput = new ArrayList<>();

                for (Classifications classifications : output) {
                    for (Category category : classifications.getCategories()) {
                        if (category.getScore() > probabilityThreshold) {
                            finalOutput.add(category);
                        }
                    }
                }

                finalOutput.sort((o1, o2) -> Float.compare(o2.getScore(), o1.getScore()));

                StringBuilder outputStr = new StringBuilder();
                for (Category category : finalOutput) {
                    outputStr.append(category.getLabel())
                            .append(": ").append(category.getScore()).append("\n");
                }
//                runOnUiThread(new Runnable() {
//                    @Override
//                    public void run() {
//                        if (finalOutput.isEmpty()) {
//                            finalout ="Could not classify";
//                        } else {
//                            finalout =outputStr.toString();
//                        }
//                    }
//                });
                if (finalOutput.isEmpty()) {
                    finalout = "Could not classify";
                } else {
                    finalout = outputStr.toString();
                }
            }
        };

        new Timer().scheduleAtFixedRate(timerTask, 1, 1000);

        return finalout;
    }
    public String onStartRecording(){
        if (checkSelfPermission(Manifest.permission.RECORD_AUDIO) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.RECORD_AUDIO}, REQUEST_RECORD_AUDIO);

        }


        try {
            classifier = AudioClassifier.createFromFile(this, modelPath);
        } catch (IOException e) {
            e.printStackTrace();
            return "Failed to initialize classifier";
        }
        tensor = classifier.createInputTensorAudio();
        record = classifier.createAudioRecord();
        record.startRecording();
        TensorAudio.TensorAudioFormat format = classifier.getRequiredTensorAudioFormat();

        //timerTask = new TimerTask() {
            //public void run() {
                int numberOfSamples = tensor.load(record);
                List<Classifications> output = classifier.classify(tensor);

                List<Category> finalOutput = new ArrayList<>();

                for (Classifications classifications : output) {
                    for (Category category : classifications.getCategories()) {
                        if (category.getScore() > probabilityThreshold) {
                            finalOutput.add(category);
                        }
                    }
                }

                finalOutput.sort((o1, o2) -> Float.compare(o2.getScore(), o1.getScore()));

                StringBuilder outputStr = new StringBuilder();
                for (Category category : finalOutput) {
                    outputStr.append(category.getLabel())
                            .append(": ").append(category.getScore()).append("\n");
                }
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (finalOutput.isEmpty()) {
                    finalout ="Could not classify";
                } else {
                    finalout =outputStr.toString();
                }
            }
        });
//                if (finalOutput.isEmpty()) {
//                    finalout = "Could not classify";
//                } else {
//                    finalout = outputStr.toString();
//                }
            //}
        //};

        //new Timer().scheduleAtFixedRate(timerTask, 1, 500);

        return finalout;
    }
    public void onStopRecording() {
        timerTask.cancel();
        record.stop();
    }
}
