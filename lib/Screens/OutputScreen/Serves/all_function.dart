import 'package:flutter/services.dart';

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}

String assetPathDanger = "assets/RedList.txt";
String assetPathNormalDanger = "assets/NormalList.txt";
List<String> dangerLabelsList = [];
List<String> normalDangerList = [];
Map<String, String> dangerLabelsListArabic = Map();
Map<String, String> normalDangerListArabic = Map();

void dangerListFun() async {
  String fileDangerContent = await rootBundle.loadString(assetPathDanger);
  dangerLabelsList = fileDangerContent.split('\n');
  for (int i = 0; i < dangerLabelsList.length; i++) {
    String e_name = dangerLabelsList[i].trim().split('#')[0];
    String ar_name = dangerLabelsList[i].trim().split('#')[1];
    dangerLabelsList[i] = e_name.trim();
    dangerLabelsListArabic[e_name.trim()] = ar_name.trim();
    print(ar_name);
  }
  dangerLabelsList.sort();
}

void normalListFun() async {
  String fileNormalDangerContent =
      await rootBundle.loadString(assetPathNormalDanger);
  normalDangerList = fileNormalDangerContent.split('\n');
  for (int i = 0; i < normalDangerList.length; i++) {
    String e_name = normalDangerList[i].trim().split('#')[0];
    String ar_name = normalDangerList[i].trim().split('#')[1];
    normalDangerList[i] = e_name.trim();
    normalDangerListArabic[e_name.trim()] = ar_name.trim();
  }
  normalDangerList.sort();
}
