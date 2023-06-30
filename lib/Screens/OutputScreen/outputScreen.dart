import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Serves/all_function.dart';

class output extends StatefulWidget {
  @override
  _output createState() => _output();
}

class _output extends State<output> {
  String notDangerOutput = '';
  String normalDangerOutput = '';
  List<Pair<String, DateTime>> detectedDangersList = [];
  attrbuties objectFromFun = attrbuties();
  @override
  void initState() {
    super.initState();
    objectFromFun.dangerListFun();
    objectFromFun.normalListFun();
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
          if (binarySearch(objectFromFun.dangerLabelsList, words[0]) != -1) {
            danger = words[0];
            danger += '\n';
          } else if (binarySearch(objectFromFun.normalDangerList, words[0]) !=
              -1) {
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
        normalDangerOutput = normalDanger;
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
