import 'package:createachannel/Screens/OutputScreen/outputScreen.dart';
import 'package:flutter/material.dart';

class aboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'We Help To Get',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '      You Well.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.alarm,
                  size: 150,
                  color: Colors.black,
                ),
                ListTile(
                  title: Column(
                    children: const [
                      Text(
                        'sound recognition platform',
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'TimesNewRoman'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'that functions through',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'recognizing',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'and analyzing sounds from',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'the environment and',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'converting',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'these into notifications',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'and alerts.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
              style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
            ),
          ),
        ),
      ),
    );
  }
}
