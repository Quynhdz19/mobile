import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_item.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_work_body.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/question_item.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ChoiceWorkGame extends StatelessWidget {
  ChoiceWorkGame({Key? key, required this.topicId, required this.topicTitle})
      : super(key: key);

  final String topicId, topicTitle;
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          topicTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: choiceWorkColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(250, 235, 201, 0.8),
        ),
        child: PageView.builder(
          //block swipe to next qn
          physics: NeverScrollableScrollPhysics(),
          controller: _workController.pageController,
          onPageChanged: _workController.updateTheQnNum,
          itemCount: _workController.works.length,
          itemBuilder: (context, index) {
            return Container(
                child: ChoiceWorkBody(
              work: _workController.works[index],
            ));
          },
        ),
      ),
    );
  }
}
