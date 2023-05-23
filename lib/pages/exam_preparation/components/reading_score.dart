import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_qs_controller.dart';
import 'package:mobile_front_end/models/exam/TestQuestion.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/answer_box.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/reading_question.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ReadingScore extends StatelessWidget {
  ReadingScore({Key? key}) : super(key: key);
  ReadingQsController _readingController = Get.put(ReadingQsController());
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {

    Color getTheRightColor(TestQuestion question) {
      if (question.status == 1) {
          return primaryColor;
      } else if (question.status == 2) {
          return redColor;
      }
      return greyColor;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Center(
            child: Text(
          "Test Result",
          style: TextStyle(fontSize: 18, color: whiteColor),
        )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: lightBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 80,
              lineWidth: 20,
              percent: _readingController.numOfCorrectAns /
                  _readingController.questions.length,
              progressColor: primaryColor,
              backgroundColor: greyColor.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
              center: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_readingController.numOfCorrectAns} / 30",
                        // /${_workController.works.length * 10}
                        style: TextStyle(
                          color: scrambleGreenColor,
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "${_readingController.numOfCorrectAns}",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Correct",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "${_readingController.numOfWrongAns}",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Incorrect",
                        style: TextStyle(
                          color: redColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "${_readingController.questions.length - _readingController.numOfWrongAns - _readingController.numOfCorrectAns}",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Incomplete",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                childAspectRatio: 1.4,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                shrinkWrap: true,
                children: List.generate(
                    30,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnswerBox(question: _readingController.questions[index]),
                          ),
                        );
                      },
                      child: Container(
                            // width: 40,
                            // height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                                color: getTheRightColor(_readingController.questions[index]),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "${index + 1}${_readingController.questions[index].selected_id == 5 ? "" : " ${_readingController.getAnswer(_readingController.questions[index].selected_id)}"}",
                                style: TextStyle(color: whiteColor, fontSize: 14),
                              ),
                            ),
                          ),
                    )),
              ),
            ),

            Padding(

              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _navigationService.navigateTo(routes.ToiecPage, arguments: {});
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red,),
                          SizedBox(width: 4,),
                          Text(
                            'quit'.tr,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: whiteColor,
                        backgroundColor: whiteColor,
                        side: BorderSide(color: Colors.red),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _navigationService.navigateTo(routes.PreTestPage, arguments: {});
                      },
                      child: Row(
                        children: [
                          Icon(Icons.repeat),
                          SizedBox(width: 4,),
                          Text(
                            'Retest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: whiteColor,
                        backgroundColor: primaryColor,
                        // side: BorderSide(color: lightPrimaryColor),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
