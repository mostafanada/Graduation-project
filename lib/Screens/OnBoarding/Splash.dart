import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OnBoarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoarding()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/splash.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Other widgets on top of the background image
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Splash2.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hear',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayfairDisplay'),
                    ),
                    Text(
                      'able',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 42,
                          fontFamily: 'PlayfairDisplay'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "We'll get your back..",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    color: Color(0xff676875),
                    fontSize: 26,
                  )),
                ),
                Text("Always",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: Color(0xff676875),
                      fontSize: 26,
                    )))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
