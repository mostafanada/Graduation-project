<<<<<<< refs/remotes/origin/HanyDevelopment
import 'package:createachannel/Screens/OnBoarding/login.dart';
import 'package:flutter/material.dart';

import 'Screens/OnBoarding/OnBoarding.dart';
import 'Screens/OnBoarding/Splash.dart';
=======
import 'dart:async';
import 'package:createachannel/Screens/OnBoarding/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:createachannel/Screens/OnBoarding/splashh.dart';
import 'notifications/displaying_notifications.dart';
import 'notifications/notifications_settings.dart';
>>>>>>> local

// import 'Screens/start/OnBoarding.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< refs/remotes/origin/HanyDevelopment
    return const MaterialApp(
      title: 'Flutter Demo',
=======
    return MaterialApp(
      title: 'Graduation Project',
>>>>>>> local
      debugShowCheckedModeBanner: false,
      //home: OnBoarding(),
      home: Splash(),
    );
  }
}
