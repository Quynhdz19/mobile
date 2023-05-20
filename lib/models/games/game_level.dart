import 'package:flutter/cupertino.dart';

class GameLevel {
  String name;
  Color mainColor;
  String imageUrl;
  Widget goto;
  int numberStar;
  GameLevel(
      {required this.name,
      required this.mainColor,
      required this.imageUrl,
      required this.goto,
      required this.numberStar});
}
