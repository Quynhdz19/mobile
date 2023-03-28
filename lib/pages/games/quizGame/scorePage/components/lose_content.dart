import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizgame/question_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';

class LoseContent extends StatelessWidget {
  const LoseContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/cry.png",
            width: 200,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
