import 'package:createachannel/Screens/OutputScreen/outputScreen.dart';
// import 'package:createachannel/Screens/contactus/sendemail/sendEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreen createState() => _ContactUsScreen();
}

class _ContactUsScreen extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "Let’s Talk",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                calling();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone:",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(123)456 7890",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                launchUrl();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1234 Street Adress City Address",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "We are Open:",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Monday : 9:00 AM - 5:30 PM \nFriday 9:00 AM - 6:00 PM \nSaturday: 11:00 AM - 5:00 PM",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                email();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-mail:",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "mail@demo.com",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => output(),
                        ));
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),
                Spacer(),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.pushReplacement(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //       builder: (context) => sendEmailScreen(),
                //     //     ));
                //   },
                //   child: Container(
                //     height: 45,
                //     width: 100,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(25),
                //       color: Colors.indigoAccent,
                //     ),
                //     // child: Center(
                //     //   child: Text(
                //     //     "Next",
                //     //     textAlign: TextAlign.center,
                //     //     style: TextStyle(
                //     //       fontSize: 25,
                //     //       fontWeight: FontWeight.bold,
                //     //       color: Colors.white,
                //     //     ),
                //     //   ),
                //     // ),
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }

  calling() async {
    const url = 'tel:+218919247183';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  email() async {
    final Uri _emailurl = Uri(
        scheme: 'mailto',
        path: 'deafapporganization@gmail.com',
        queryParameters: {'subject': 'Hello'});

    if (await canLaunch(_emailurl.toString())) {
      await launch(_emailurl.toString());
    } else {
      throw 'Could not launch $_emailurl';
    }
  }

  void launchUrl() async {
    const url = 'https://goo.gl/maps/MEEEdDY5DG7TzfUU9';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
