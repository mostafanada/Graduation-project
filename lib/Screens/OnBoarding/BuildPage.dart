import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  BuildPage(
      {this.text1,
      this.image2,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      this.image,
      this.fontWeight1,
      this.fontWeight2,
      this.fontWeight3,
      this.fontWeight4});
  final controller = PageController();
  String? text1;
  String? text2;
  String? text3;
  String? text4;
  String? text5;
  String? image;
  Image? image2;
  FontWeight? fontWeight1;
  FontWeight? fontWeight2;
  FontWeight? fontWeight3;
  FontWeight? fontWeight4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6b66c),
      body: Column(
        children: [
          SizedBox(
            height: 125,
          ),
          Center(
              child: Stack(
            children: [
              Image.asset(
                '$image',
                width: 196,
                height: 326,
              ),
              image2!,
              //Image.asset('$image2',width: 196,height: 326,alignment: Alignment.topLeft,),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$text1 ',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: fontWeight1,
                    fontFamily: 'PlayfairDisplay'),
              ),
              Text(
                '$text2 ',
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: fontWeight2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$text3 ',
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: fontWeight3),
              ),
              Text(
                '$text4',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: fontWeight4,
                    fontFamily: 'PlayfairDisplay'),
              ),
            ],
          ),
          Column(
            children: [
              Text('$text5 ',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'PlayfairDisplay')),
            ],
          ),
        ],
      ),
    );
  }
}
