import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_test_controller.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/score_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';

class ReadingScore extends StatelessWidget {
  ReadingScore({Key? key}) : super(key: key);
  ReadingTestController _readingController = Get.put(ReadingTestController());
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ScorePage(correctAns: _readingController.numOfCorrectAns, wrongAns: _readingController.numOfWrongAns, qsList: _readingController.questions);
  }
}
