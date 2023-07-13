import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../OutputScreen/outputScreen.dart';
import 'BuildPage.dart';
import 'login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool? isLast;
  List list = [
    BuildPage(
      image2: Image.asset(
        'assets/images/Clip1.png',
        width: 196,
        height: 326,
        alignment: Alignment.topLeft,
      ),
      image: "assets/images/Frame.png",
      text1: "We detect",
      fontWeight1: FontWeight.w700,
      text2: 'the most important',
      text3: 'sounds and',
      text4: 'alert you when',
      fontWeight4: FontWeight.w700,
      text5: 'needed',
    ),
    BuildPage(
      image2: Image.asset(
        'assets/images/photo.jpg',
        width: 10,
        height: 326,
        alignment: Alignment.topLeft,
      ),
      image: 'assets/images/Group 2.png',
      text1: "Set alerts",
      fontWeight1: FontWeight.w700,
      text2: "using phone's",
      text3: 'vibration',
      text4: 'increase of fire',
      fontWeight4: FontWeight.w700,
      text5: 'alarms',
    ),
    BuildPage(
      image2: Image.asset(
        'assets/images/photo.jpg',
        width: 10,
        height: 326,
        alignment: Alignment.topLeft,
      ),
      image: 'assets/images/Clip2.png',
      text1: "In a queue and",
      text2: "want's to get",
      fontWeight2: FontWeight.w700,
      text3: 'notified',
      fontWeight3: FontWeight.w700,
      text4: 'when you are called?',
      text5: 'set it up here',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6b66c),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => list[index],
                itemCount: list.length,
                controller: controller,
                onPageChanged: (index) {
                  if (index == list.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('last');
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print('Not Last');
                  }
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                spacing: 16,
                dotWidth: 20,
                dotHeight: 20,
                dotColor: Colors.white,
                activeDotColor: Color(0xff8588C7),
              ),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 30, right: 30, bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text('Back',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xff5B5FC7),
                            fontSize: 22,
                          ),
                        )),
                  ),
                  MaterialButton(
                      child: Text('Next',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          )),
                      onPressed: () {
                        if (isLast == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => output(),
                              ));
                        }
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      color: Color(0xff8588C7),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))
                ],
              ),
            )
          ],
        ));
  }
}
