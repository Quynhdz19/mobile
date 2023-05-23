import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/score_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';

class PracticeScore extends StatelessWidget {
  PracticeScore({Key? key}) : super(key: key);
  PracticeController _practiceController = Get.put(PracticeController());

  @override
  Widget build(BuildContext context) {
    return ScorePage(correctAns: _practiceController.numOfCorrectAns, wrongAns: _practiceController.numOfWrongAns, qsList: _practiceController.questions);
  }
}
