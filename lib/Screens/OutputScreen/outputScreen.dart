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
  bool _buttonClicked = false;
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

  Expanded greetingText() {
    return Expanded(
      flex: 7,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                WidgetSpan(child: SizedBox(width: 16)),
                TextSpan(
                  text:
                      'We detect the most important sounds and alert you when needed\n',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'We detect the most important sounds and alert you when needed',
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
                WidgetSpan(child: SizedBox(width: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded OutputList(BuildContext context) {
    List<Widget> generateDangerLabels(int count) {
      List<Widget> subCards = [];
      for (int i = 1; i <= count; i++) {
        subCards.add(
          Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            color: Color(0xFFD9D9D9),
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Subcard $i',
                style: TextStyle(color: Colors.red),
              ),
              trailing: Image.asset('assets/Alarm.png'),
            ),
          ),
        );
      }
      return subCards;
    }

    List<Widget> generateNormalLabels(int count) {
      List<Widget> subCards = [];
      for (int i = 1; i <= count; i++) {
        subCards.add(
          Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            color: Color.fromRGBO(217, 217, 217, 1),
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Subcard $i',
                style: TextStyle(color: Color.fromRGBO(72, 72, 82, 1)),
              ),
            ),
          ),
        );
      }
      return subCards;
    }

    return Expanded(
        flex: 7,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                color: Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: ListTile(
                  subtitle: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: generateDangerLabels(1),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                color: Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: ListTile(
                  subtitle: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: generateNormalLabels(2),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                color: Color.fromRGBO(217, 217, 217, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: ListTile(
                  subtitle: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: generateNormalLabels(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.black, // Set the color of ListTile dividers here
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor:
                Colors.white, // Set the background color of AppBar here
            elevation: 0.0, // Remove shadow and border of AppBar here
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black, // Set the color of the drawer icon here
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          drawer: Drawer(
            child: Container(
              color: Color.fromRGBO(
                  182, 183, 210, 1), // Set the background color here
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    ListTile(
                      title: Text('History'),
                    ),
                    ListTile(
                      title: Text('Settings'),
                    ),
                    ListTile(
                      title: Text('Contact us'),
                    ),
                    ListTile(
                      title: Text('About App'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.asset(
                    'assets/TopImage.png',
                  ),
                ),
              ),
              _buttonClicked ? OutputList(context) : greetingText(),
              Expanded(
                flex: 1,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _buttonClicked = !_buttonClicked;
                    });
                  },
                  icon: Icon(Icons.start),
                  label: Text(_buttonClicked ? 'Stop' : 'Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
