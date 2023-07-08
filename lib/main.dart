import 'package:createachannel/Screens/OutputScreen/outputScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/SettingScreen/settin_display/display_mode_screen.dart';
import 'Screens/SettingScreen/settin_display/displayscreen.dart';
// import 'Screens/start/OnBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: OnBoarding(),
      home: output(),
    );
  }
}
