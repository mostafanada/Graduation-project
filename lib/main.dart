import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String finalOutput = '';

  @override
  void initState() {
    super.initState();
    // Initialize the EventChannel
    final channel = EventChannel('example.com/channel');
    // Set up a listener to receive events from the EventChannel
    channel.receiveBroadcastStream().listen((event) {
      setState(() {
        finalOutput = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Final Output'),
        ),
        body: Center(
          child: Text(finalOutput),
        ),
      ),
    );
  }
}
p