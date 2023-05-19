import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';
  void initState() {
    super.initState();
    // استدعاء الدالة من الأندرويد كل ثانية وتحديث النتيجة
    Timer.periodic(Duration(seconds: 1), (timer) async {
      String newResult = await _getResultFromAndroid(); // استدعاء الدالة من الأندرويد
      setState(() {
        _batteryLevel = newResult; // تحديث النتيجة في حالة الشاشة
      });
    });
  }
  Future<void> startTimer() async {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      String batteryLevel;
      try {
        final String result = await platform.invokeMethod('startRecording');
        batteryLevel = '$result .';
      } on PlatformException catch (e) {
        batteryLevel = "Failed to get battery level: '${e.message}'.";
      }
      setState(() {
        _batteryLevel =
            batteryLevel; // Call a function to generate the updated output
      });
    });
  }
  Future<void> _getBatteryLevel() async {
    // Timer.periodic(Duration(seconds: 1), (timer) async {
      // Update the output every second
      // Call a function to generate the updated output

    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('startRecording');
      batteryLevel = '$result .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
        _batteryLevel = batteryLevel; // Call a function to generate the updated output
      });
    // });
  }
  Future<String> _getResultFromAndroid() async {
    String result = await platform.invokeMethod('startRecording'); // استدعاء الدالة من الأندرويد
    return result;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){print("start aaa");},
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
