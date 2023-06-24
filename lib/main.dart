import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}

List<String> dangerLabelsList = [];
List<String> normalDangerList = [];

Future<void> main() async {
  runApp(MyApp());
  String assetPathDanger = "assets/RedList.txt";
  String fileDangerContent = await rootBundle.loadString(assetPathDanger);
  dangerLabelsList = fileDangerContent.split('\n');
  for (int i = 0; i < dangerLabelsList.length; i++) {
    dangerLabelsList[i] = dangerLabelsList[i].trim();
  }
  dangerLabelsList.sort();

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
  String notDangerOutput = '';
  String normalDangerOutput = '';
  List<Pair<String, DateTime>> detectedDangersList = [];
  @override
  void initState() {
    super.initState();

    // Remove dangers labels after 5 sec
    Timer.periodic(Duration(seconds: 1), (timer) {
      detectedDangersList.removeWhere((label) =>
          DateTime.now().difference(label.second).inMilliseconds >= 5000);
    });
    // Initialize the EventChannel

    final channel = EventChannel('example.com/channel');
    channel.receiveBroadcastStream().listen((event) {
      setState(() {
        String splitedString = event;
        List<String> curLine = splitedString.split('\n');
        String danger = '';
        String nonDanger = '';
        String normalDanger = '';
        for (int i = 0; i < curLine.length; i++) {
          List<String> words = curLine[i].split(':');
          if (binarySearch(dangerLabelsList, words[0]) != -1) {
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
        if (danger.isNotEmpty) {
          detectedDangersList.add(Pair(danger, DateTime.now()));
        }
        normalDangerOutput += normalDanger;
        if (nonDanger != 'Could not classify\n') {
          notDangerOutput = nonDanger;
        }
      });
    });
  }

  String calcOutputDanger() {
    String curOutput = "";
    for (var x in detectedDangersList) {
      curOutput += x.first;
    }
    return curOutput;
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
              Text(calcOutputDanger()),
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
