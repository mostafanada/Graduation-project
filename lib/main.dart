import 'package:createachannel/Screens/OnBoarding/login.dart';
import 'package:flutter/material.dart';

import 'Screens/OnBoarding/OnBoarding.dart';
import 'Screens/OnBoarding/Splash.dart';
import 'foreGroundService/foregroundService.dart';

// import 'Screens/start/OnBoarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
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
