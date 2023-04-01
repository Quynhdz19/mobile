import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizgame/question_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';

class WinContent extends StatelessWidget {
  WinContent({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/champion.png",
            width: 200,
          ),
          Image.asset(
            "assets/images/congratulation.png",
            width: 250,
          ),
        ],
      ),
    );
  }
}
