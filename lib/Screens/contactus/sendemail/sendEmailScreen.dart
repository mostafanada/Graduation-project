// import 'package:createachannel/Screens/contactus/contactUsScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class sendEmailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ContactUsScreen(),
//                   ));
//             },
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             )),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // SizedBox(
//               //   height: 20,
//               // ),
//               Text(
//                 "Our Contacts",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "You can contact us any way that is convenient for you.\n We are available via fax or email. You can also use a quick \ncontact form below or visit us personally.",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Name",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(width: 3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(50.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(width: 3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(50.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.all(20),
//                 height: 270,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 4,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: "Write Your Message",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       Fluttertoast.showToast(
//                         msg: 'Message sent successfully',
//                         fontSize: 18,
//                         gravity: ToastGravity.BOTTOM_LEFT,
//                         backgroundColor: Colors.grey[200],
//                         textColor: Colors.black,
//                       );
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: Colors.indigoAccent,
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Submit",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:createachannel/Screens/contactus/contactUsScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class sendEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Our Contacts",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold))),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text("You can contact us any way that is",
                      style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                        fontSize: 20,
                      ))),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(" convenient for you. We ",
                            style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                              fontSize: 20,
                            ))),
                        Text("are available",
                            style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Text("fax or email. You can also use a quick",
                      style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                        fontSize: 20,
                      ))),
                  Text("contact form below or visit us",
                      style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                        fontSize: 20,
                      ))),
                  Text("personally",
                      style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                        fontSize: 20,
                      ))),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Your Name*",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Your Email Address ",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Write Your Message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: 'Message sent successfully',
                            fontSize: 18,
                            gravity: ToastGravity.BOTTOM_LEFT,
                            backgroundColor: Colors.grey[200],
                            textColor: Colors.black,
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff5B5FC7),
                          ),
                          child: Center(
                            child: Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   height: 270,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.5),
              //         spreadRadius: 2,
              //         blurRadius: 4,
              //         offset: Offset(0, 3),
              //       ),
              //     ],
              //   ),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       labelText: "Write Your Message",
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Spacer(),
              //     GestureDetector(
              //       onTap: () {
              //         Fluttertoast.showToast(
              //           msg: 'Message sent successfully',
              //           fontSize: 18,
              //           gravity: ToastGravity.BOTTOM_LEFT,
              //           backgroundColor: Colors.grey[200],
              //           textColor: Colors.black,
              //         );
              //       },
              //       child: Container(
              //         height: 50,
              //         width: 120,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(25),
              //           color: Colors.indigoAccent,
              //         ),
              //         child: Center(
              //           child: Text(
              //             "Submit",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
