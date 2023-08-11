// import 'package:createachannel/Screens/OutputScreen/outputScreen.dart';
// import 'package:flutter/material.dart';

// class aboutScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.amber,
//       ),

//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Align(
//           alignment: Alignment.topCenter,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 90),
//             child: Column(
//               children: [
//                 ListTile(
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'We Help To Get',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         '      You Well.',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Icon(
//                   Icons.alarm,
//                   size: 150,
//                   color: Colors.black,
//                 ),
//                 ListTile(
//                   title: Column(
//                     children: const [
//                       Text(
//                         'sound recognition platform',
//                         style: TextStyle(
//                             fontSize: 18, fontFamily: 'TimesNewRoman'),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'that functions through',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'recognizing',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'and analyzing sounds from',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'the environment and',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'converting',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'these into notifications',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'and alerts.',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: Container(
//           alignment: Alignment.bottomLeft,
//           padding: EdgeInsets.only(left: 16, bottom: 16),
//           child: TextButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => output(),
//                   ));
//             },
//             child: Text(
//               'Back',
//               style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:createachannel/Screens/OutputScreen/outputScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class aboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('We Help To Get',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 26,
                                  ),
                                )),
                            Text(
                              '      You Well.',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Image.asset(
                        'assets/images/about.png',
                        width: 230,
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('sound recognition ',
                                    style: GoogleFonts.playfairDisplay(
                                      textStyle: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Text(
                                  'platform',
                                  style: TextStyle(
                                    fontSize: 26,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'that functions through',
                              style: TextStyle(fontSize: 26),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'recognizing',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'and ',
                                  style: GoogleFonts.playfairDisplay(
                                    textStyle: TextStyle(
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                                Text(
                                  'analyzing',
                                  style: GoogleFonts.playfairDisplay(
                                    textStyle: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  ' sounds from',
                                  style: GoogleFonts.playfairDisplay(
                                    textStyle: TextStyle(
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'the environment and',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'converting',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'these into notifications',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('and ',
                                    style: GoogleFonts.playfairDisplay(
                                      textStyle: TextStyle(fontSize: 26),
                                    )),
                                Text('alerts',
                                    style: GoogleFonts.playfairDisplay(
                                      textStyle: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => output(),
                    ));
              },
              child: Text(
                'Back',
                style: TextStyle(fontSize: 26, color: Colors.deepPurpleAccent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
