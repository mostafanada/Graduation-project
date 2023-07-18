import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/OnBoarding/Splash.dart';
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
    return const MaterialApp(
      title: 'Graduation Project',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      //  home: output(),
    );
  }
}
