import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> dangerList = [];
List<String> normalDangerList = [];

Future<void> main() async {
  runApp(MyApp());
  String assetPathDanger = "assets/RedList.txt";
  String fileDangerContent = await rootBundle.loadString(assetPathDanger);
  dangerList = fileDangerContent.split('\n');
  for (int i = 0; i < dangerList.length; i++) {
    dangerList[i] = dangerList[i].trim();
  }
  dangerList.sort();

  String assetPathNormalDanger = "assets/NormalList.txt";
  String fileNormalDangerContent =
      await rootBundle.loadString(assetPathNormalDanger);
  normalDangerList = fileNormalDangerContent.split('\n');
  for (int i = 0; i < normalDangerList.length; i++) {
    normalDangerList[i] = normalDangerList[i].trim();
  }
  normalDangerList.sort();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dangerOutput = '';
  String notDangerOutput = '';
  String normalDangerOutput = '';
  @override
  void initState() {
    super.initState();
    // Initialize the EventChannel
    final channel = EventChannel('example.com/channel');
    // Set up a listener to receive events from the EventChannel
    channel.receiveBroadcastStream().listen((event) {
      setState(() {
        String splitedString = event;
        List<String> curLine = splitedString.split('\n');
        String danger = '';
        String nonDanger = '';
        String normalDanger = '';
        for (int i = 0; i < curLine.length; i++) {
          List<String> words = curLine[i].split(':');
          if (binarySearch(dangerList, words[0]) != -1) {
            danger = words[0];
            danger += '\n';
          } else if (binarySearch(normalDangerList, words[0]) != -1) {
            normalDanger = words[0];
            normalDanger += '\n';
          } else {
            nonDanger += words[0];
            nonDanger += '\n';
          }
        }
        dangerOutput += danger;
        normalDangerOutput += normalDanger;
        if (nonDanger != 'Could not classify') {
          notDangerOutput = nonDanger;
        }
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Danger Output:'),
              Text(dangerOutput),
              SizedBox(height: 20),
              Text('Normal Danger Output:'),
              Text(normalDangerOutput),
              SizedBox(height: 20),
              Text('Non-Danger Output:'),
              Text(notDangerOutput),
            ],
          ),
        ),
      ),
    );
  }
}
