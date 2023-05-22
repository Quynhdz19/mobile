import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_qs_controller.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/listen_question_p1.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/listen_test.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/reading_question.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ToiecExamPage extends StatelessWidget {
  ToiecExamPage({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();
  ReadingQsController _readingController = Get.put(ReadingQsController());

  @override
  Widget build(BuildContext context) {
          return Scaffold(

            body: Container(
              decoration: BoxDecoration(
                color: lightBackgroundColor,
              ),
              child: PageView.builder(
                //block swipe to next qn
                physics: NeverScrollableScrollPhysics(),
                controller: _readingController.pageController,
                onPageChanged: _readingController.updateTheQnNum,
                itemCount: _readingController.questions.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: ReadingQuestion(
                        question: _readingController.questions[index],
                      ));
                },
              ),
            ),
          );

  }
}
