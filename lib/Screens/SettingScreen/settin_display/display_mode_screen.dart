import 'package:flutter/material.dart';

import '../../commonVariables/commonVariable.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => DisplayScreenState();
}

class DisplayScreenState extends State<DisplayScreen> {
  String isSelect = 'show';

  void showTimePickerForStart() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        startTime = value!;
      });
    });
  }

  void showTimePickerForEnd() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        endTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5),
          centerTitle: true,
          title: Text(
            'Display Mode',
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF484852),
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(bottom: 25.0, top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffd9d9d9)),
                  child: ListTile(
                      title: Text(
                        'Tap to show',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Always On Display will turn on with a tab',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF757373)),
                      ),
                      trailing: Radio(
                          activeColor: Colors.black,
                          value: isSelect,
                          groupValue: 'show',
                          onChanged: (value) {
                            isSelect = 'show';
                            setState(() {});
                          })),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffd9d9d9)),
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(
                            'Scheduled',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Radio(
                              activeColor: Colors.black,
                              value: isSelect,
                              groupValue: 'Scheduled',
                              onChanged: (value) {
                                isSelect = 'Scheduled';
                                setState(() {});
                              })),
                      isSelect != 'Scheduled'
                          ? Container()
                          : Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child:
                                      Divider(thickness: 1, color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showTimePickerForStart();
                                  },
                                  child: ListTile(
                                    title: Text(
                                      'Start',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                      startTime.format(context).toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child:
                                      Divider(thickness: 1, color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showTimePickerForEnd();
                                  },
                                  child: ListTile(
                                    title: Text(
                                      'End',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                      endTime.format(context).toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffd9d9d9)),
                  child: ListTile(
                      title: Text(
                        'All Day',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Radio(
                          activeColor: Colors.black,
                          value: isSelect,
                          groupValue: 'All Day',
                          onChanged: (value) {
                            isSelect = 'All Day';
                            setState(() {});
                          })),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    'Always On Display is not available when \n the battery is lower than 10%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      )),
                ),
              ],
            )));
  }
}
