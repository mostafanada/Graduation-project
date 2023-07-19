import 'dart:async';
import 'package:createachannel/Screens/OnBoarding/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:createachannel/Screens/OnBoarding/splashh.dart';
import 'notifications/displaying_notifications.dart';
import 'notifications/notifications_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const channel = EventChannel('example.com/channel');
  await notificationServiceInitialization();
  channel.receiveBroadcastStream().listen(showNotification);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduation Project',
      debugShowCheckedModeBanner: false,
      //home: OnBoarding(),
      home: Splash(),
    );
  }
}