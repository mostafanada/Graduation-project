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
    final channel = EventChannel('example.com/channel');
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
