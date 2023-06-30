import 'package:flutter/services.dart';

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}

class attrbuties {
  String assetPathDanger = "assets/RedList.txt";
  String assetPathNormalDanger = "assets/NormalList.txt";
  List<String> dangerLabelsList = [];
  List<String> normalDangerList = [];

  void dangerListFun() async {
    String fileDangerContent = await rootBundle.loadString(assetPathDanger);
    dangerLabelsList = fileDangerContent.split('\n');
    for (int i = 0; i < dangerLabelsList.length; i++) {
      dangerLabelsList[i] = dangerLabelsList[i].trim();
    }
    dangerLabelsList.sort();
  }

  void normalListFun() async {
    String fileNormalDangerContent =
        await rootBundle.loadString(assetPathNormalDanger);
    normalDangerList = fileNormalDangerContent.split('\n');
    for (int i = 0; i < normalDangerList.length; i++) {
      normalDangerList[i] = normalDangerList[i].trim();
    }
    normalDangerList.sort();
  }
}
