import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import '../SettingScreen/settin_display/display_mode_screen.dart';
import '../SettingScreen/settings_screen.dart';
import '../about screen/aboutScreen.dart';
import '../commonVariables/commonVariable.dart';
import '../contactus/contactUsScreen.dart';
import 'Serves/all_function.dart';

class output extends StatefulWidget {
  @override
  _output createState() => _output();
}

class _output extends State<output> {
  List<Pair<String, DateTime>> detectedDangersList = [];
  List<Pair<String, DateTime>> detectedNormalDangerList = [];
  List<Pair<String, DateTime>> detectedNormalList = [];
  List<String> Score = [];
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    dangerListFun();
    normalListFun();
    Timer.periodic(Duration(seconds: 1), (timer) {
      print(buttonClicked);
      isWithinSleepModeTime();
      detectedDangersList.removeWhere((label) =>
          DateTime.now().difference(label.second).inMilliseconds >= 5000);
      detectedNormalDangerList.removeWhere((label) =>
          DateTime.now().difference(label.second).inMilliseconds >= 5000);
      detectedNormalList.removeWhere((label) =>
          DateTime.now().difference(label.second).inMilliseconds >= 5000);
    });
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
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Playfair Display'),
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
    List<Widget> generateDangerLabels() {
      List<Widget> subCards = [];
      for (var x in detectedDangersList) {
        subCards.add(
          (dengerDisplay)
              ? Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  color: Color(0xFFD9D9D9),
                  child: ListTile(
                    leading: Icon((emojiDisplay) ? Icons.star : null),
                    title: Text(
                      (textDisplay)
                          ? x.first +
                              "  " +
                              dangerLabelsListArabic[x.first.split(': ')[0]]!
                          : '',
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: Image.asset('assets/Alarm.png'),
                  ),
                )
              : Card(),
        );
      }

      return subCards;
    }

    List<Widget> generateNormalLabels() {
      List<Widget> subCards = [];
      for (var x in detectedNormalList) {
        subCards.add(
          Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            color: Color.fromRGBO(217, 217, 217, 1),
            child: ListTile(
              leading: Icon((emojiDisplay) ? Icons.star : null),
              title: Text(
                (textDisplay) ? x.first : '',
                style: TextStyle(color: Color.fromRGBO(72, 72, 82, 1)),
              ),
            ),
          ),
        );
      }
      return subCards;
    }

    List<Widget> generatedNormalDangerLabels() {
      List<Widget> subCards = [];
      for (var x in detectedNormalDangerList) {
        subCards.add(
          Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            color: Color.fromRGBO(217, 217, 217, 1),
            child: ListTile(
              leading: Icon((emojiDisplay) ? Icons.star : null),
              title: Text(
                (textDisplay)
                    ? x.first +
                        "  " +
                        normalDangerListArabic[x.first.split(': ')[0]]!
                    : '',
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
              detectedDangersList.length > 0
                  ? Card(
                      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                      color: Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: ListTile(
                        subtitle: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: generateDangerLabels(),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
              detectedNormalDangerList.length > 0
                  ? Card(
                      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                      color: Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: ListTile(
                        subtitle: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: generatedNormalDangerLabels(),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
              // detectedNormalList.length > 0
              //     ? Card(
              //         margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
              //         color: Color.fromRGBO(217, 217, 217, 1),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(22.0),
              //         ),
              //         child: ListTile(
              //           subtitle: Container(
              //             child: SingleChildScrollView(
              //               child: Column(
              //                 children: generateNormalLabels(),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     : SizedBox(height: 0),
            ],
          ),
        ));
  }

  void isWithinSleepModeTime() {
    DateTime now = DateTime.now();
    TimeOfDay currentTime = TimeOfDay.fromDateTime(now);
    isSleepMood = currentTime.hour >= startTime.hour &&
        currentTime.hour <= endTime.hour &&
        currentTime.minute >= startTime.minute &&
        currentTime.minute <= endTime.minute;
    if (buttonClicked && isSleepMood) {
      stopRecording();
    } else if ((!buttonClicked || buttonClicked) && !isSleepMood) {
      if (isRecording) startRecording();
    } else {
      stopRecording();
    }
  }

  void stopRecording() {
    detectedDangersList.clear();
    detectedNormalDangerList.clear();
    detectedNormalList.clear();
    subscription?.cancel();
    Vibration.cancel();
    setState(() {
      buttonClicked = false;
    });
  }

  void startRecording() {
    setState(() {
      buttonClicked = true;
    });

    final channel = EventChannel('example.com/channel');

    subscription = channel.receiveBroadcastStream().listen((event) {
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
            danger += ": " + words[1];
          } else if (binarySearch(normalDangerList, words[0]) != -1) {
            normalDanger = words[0];
            normalDanger += ": " + words[1];
          } else {
            if (words[0].isNotEmpty && words[0] != 'Could not classify') {
              nonDanger = words[0];
              nonDanger += ": " + words[1];
            }
          }
        }
        if (danger.isNotEmpty) {
          if (!detectedDangersList.any(
              (pair) => pair.first.split(": ")[0] == danger.split(": ")[0])) {
            detectedDangersList.add(Pair(danger, DateTime.now()));
            (vibrationMood) ? Vibration.vibrate(duration: 1000) : null;
          }
        }
        if (normalDanger.isNotEmpty) {
          if (!detectedNormalDangerList.any((pair) =>
              pair.first.split(": ")[0] == normalDanger.split(": ")[0])) {
            detectedNormalDangerList.add(Pair(normalDanger, DateTime.now()));
            (vibrationMood) ? Vibration.vibrate(duration: 1000) : null;
          }
        }
        if (nonDanger.isNotEmpty) {
          if (!detectedNormalList.any((pair) =>
              pair.first.split(": ")[0] == nonDanger.split(": ")[0])) {
            detectedNormalList.add(Pair(nonDanger, DateTime.now()));
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.black,
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          drawer: SizedBox(
            width: 197,
            height: 852,
            child: Drawer(
              child: Container(
                color: Color(0xFFB6B7D2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 220,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('History',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsScreen(),
                              ));
                        },
                        child: Text('Setting',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactUsScreen(),
                              ));
                        },
                        child: Text('Contact Us',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => aboutScreen(),
                              ));
                        },
                        child: Text('About us',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
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
                buttonClicked ? OutputList(context) : greetingText(),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonClicked = !buttonClicked;
                          isRecording = !isRecording;
                          if (!buttonClicked) stopRecording();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onSurface: Colors.white,
                        elevation: 0.0,
                        side: BorderSide.none,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        child: Image.asset(
                          !buttonClicked
                              ? 'assets/icon_start.png'
                              : 'assets/icon_stop.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
