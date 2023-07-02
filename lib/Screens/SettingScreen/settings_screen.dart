import 'package:flutter/material.dart';
import 'package:my_own_project/display_mode_screen.dart';
import 'package:my_own_project/customize_sounds.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isAlert = false;
  bool isEmogi = false;
  bool isText = false;
  bool isPhone = false;
  bool isSmartWatch = false;
  bool isNormal = false;
  bool isDanger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 120,
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFF484852),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 25.0, top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                      builder: (context,setState) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF333333),width: 3)
                          ),
                          backgroundColor: Color(0xFFD8D7D7),
                          title: Text(
                            'Please Select How You Want To Be Alert:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF484852),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckboxListTile(
                                value: isPhone,
                                onChanged: (value) {
                                  setState((){
                                    isPhone = value??false;
                                  });
                                },
                                title: Text('Phone',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),),
                                checkColor: Colors.black,
                                enabled: true,
                                activeColor: Color(0xFF8588C7),
                              ),
                              CheckboxListTile(
                                value: isSmartWatch,
                                onChanged: (value) {
                                  setState((){
                                    isSmartWatch = value??false;
                                  });
                                },
                                title: Text('Smart Watch',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),),
                                checkColor: Colors.black,
                                enabled: true,
                                activeColor: Color(0xFF8588C7),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'Alert Deliver',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF676875),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisplayScreen(),
              ));},
              child: ListTile(
                title: Text(
                  'Display mode',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF676875),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context,setState) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF333333),width: 3)
                        ),
                        backgroundColor: Color(0xFFD8D7D7),
                        title: Text(
                          'Please Select How You Want The Output To Be :',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF484852),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CheckboxListTile(
                              value: isEmogi,
                              onChanged: (value) {
                               setState((){
                                 isEmogi = value??false;
                               });
                              },
                              title: Text('EMOGI',style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),),
                              checkColor: Colors.black,
                              enabled: true,
                              activeColor: Color(0xFF8588C7),
                            ),
                            CheckboxListTile(
                              value: isText,
                              onChanged: (value) {
                               setState((){
                                 isText = value??false;
                               });
                              },
                              title: Text('Text',style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),),
                              checkColor: Colors.black,
                              enabled: true,
                              activeColor: Color(0xFF8588C7),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'Alert Output',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF676875),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                      builder: (context,setState) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFF333333),width: 3)
                          ),
                          backgroundColor: Color(0xFFD8D7D7),
                          title: Text(
                            'Please Select How You Want The Output To Be :',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF484852),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckboxListTile(
                                value: isDanger,
                                onChanged: (value) {
                                  setState((){
                                    isDanger = value??false;
                                  });
                                },
                                title: Text('Danger',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),),
                                checkColor: Colors.black,
                                enabled: true,
                                activeColor: Color(0xFF8588C7),
                              ),
                              CheckboxListTile(
                                value: isNormal,
                                onChanged: (value) {
                                  setState((){
                                    isNormal = value??false;
                                  });
                                },
                                title: Text('Normal',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),),
                                checkColor: Colors.black,
                                enabled: true,
                                activeColor: Color(0xFF8588C7),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'Display Output',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF676875),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomizeSoundScreen(),));},
              child: ListTile(
                title: Text(
                  'Customize Sounds',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF676875),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
                title: Text(
                  'Alerting',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF676875),
                  ),
                ),
                subtitle: Text(
                  'Alert Mode is ON',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF757373),
                  ),
                ),
                trailing: Checkbox(
                  value: isAlert,
                  onChanged: (value) {
                    isAlert = value ?? false;
                    setState(() {});
                  },
                  checkColor: Colors.black,
                  activeColor: Color(0xFF8588C7),
                  fillColor: MaterialStatePropertyAll(Color(0xFF8588C7)),
                  focusColor: Color(0xFF8588C7),
                  hoverColor: Color(0xFF8588C7),
                )),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}












