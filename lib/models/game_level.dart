import 'package:flutter/cupertino.dart';

class GameLevel {
  String name;
  Color mainColor;
  Color extraColor;
  Widget goto;
  int noOfStar;
  GameLevel(
      {required this.name,
      required this.mainColor,
      required this.extraColor,
      required this.goto,
      required this.noOfStar});
}
