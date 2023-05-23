import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/models/exam/TestQuestion.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/fullTest/reading_option.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/practice_option.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ReadingPracticeWidget extends StatelessWidget {
  ReadingPracticeWidget({Key? key, required this.question}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  PracticeController _practiceController = Get.put(PracticeController());
  final TestQuestion question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 25),
          color: lightPrimaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    "Question ${_practiceController.questionNumber.value}/${_practiceController.questions.length}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ),
                ),
              ),
              Divider(
                color: primaryColor.withOpacity(0.6),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Text(
                  question.question,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  question.options.length,
                      (index) => PracticeOption(
                        indexQs: 0,
                    index: index,
                    choice: question.options[index],
                    press: () => _practiceController.checkAns(question, index),
                    selected: 2,
                    answer: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 120,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  onPressed: _practiceController.nextQuestion,
                  child: Row(
                    children: [
                      Icon(Icons.navigate_next),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'next'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    foregroundColor: whiteColor,
                    backgroundColor: primaryColor,
                    side: BorderSide(color: lightPrimaryColor),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
