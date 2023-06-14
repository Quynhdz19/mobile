import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/practice_multiple_widget.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/reading_practice_widget.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ReadingPracticePage extends StatelessWidget {
  ReadingPracticePage({Key? key, required this.pageId}) : super(key: key);
  final int pageId;
  final NavigationService _navigationService = locator<NavigationService>();
  PracticeController _practiceController = Get.put(PracticeController());
  @override
  Widget build(BuildContext context) {
    pageId == 5 ? _practiceController.getReadingPart5Data() : _practiceController.getReadingPart6Data();
    return Container(
      decoration: BoxDecoration(
        color: lightBackgroundColor,
      ),
      child: PageView.builder(
        //block swipe to next qn
        physics: NeverScrollableScrollPhysics(),
        controller: _practiceController.pageController,
        onPageChanged: _practiceController.updateTheQnNum,
        itemCount: pageId == 5 ? _practiceController.questions.length : _practiceController.components.length,
        itemBuilder: (context, index) {
          return Container(
              child: pageId == 5 ? ReadingPracticeWidget(
                question: _practiceController.questions[index]
              ) : PracticeMultipleWidget(component: _practiceController.components[index])
          );
        },
      ),
    );
  }
}
