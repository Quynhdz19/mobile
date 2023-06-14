import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_test_controller.dart';
import 'package:mobile_front_end/models/exam/TestQuestion.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/score_page.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/fullTest/reading_option.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;


class AnswerBox extends StatelessWidget {
  AnswerBox({Key? key, required this.question}) : super(key: key);

  final TestQuestion question;
  final NavigationService _navigationService = locator<NavigationService>();
  ReadingTestController _readingController = Get.put(ReadingTestController());
  PracticeController _practiceController = Get.put(PracticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Center(child: Text("Answer", style: TextStyle(fontSize: 18, color: whiteColor),)),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 25),
          color: lightPrimaryColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TimeBar(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    "Question ${question.id + 1}/30",
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
                      (index) => ReadingOption(
                    index: index,
                    choice: question.options[index],
                    press: (){},
                        answer: index == question.answer_id ? 1 : 0,
                        selected: index == question.selected_id ? 1 : 0,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScorePage(correctAns: _practiceController.numOfCorrectAns, wrongAns: _practiceController.numOfWrongAns, qsList: _practiceController.questions),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.check),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'done'.tr,
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
        ),
    );
  }
}
