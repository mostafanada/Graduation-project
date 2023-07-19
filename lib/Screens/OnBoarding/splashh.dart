import 'package:createachannel/Screens/OnBoarding/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
// import 'Screens/start/OnBoarding.dart';

class Splash extends StatefulWidget {
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 3000,
      ),
      vsync: this,
      value: 0.1,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );
    _controller.forward();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoarding()));
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
            body: Center(
          child: Stack(children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScaleTransition(
                      scale: _animation,
                      alignment: Alignment.center,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Image.asset(
                              'assets/images/ic.jpg', height: 200,
                              //fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]))),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
