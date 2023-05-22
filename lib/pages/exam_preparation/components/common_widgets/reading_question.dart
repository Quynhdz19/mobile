import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_qs_controller.dart';
import 'package:mobile_front_end/models/exam/TestQuestion.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/reading_option.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ReadingQuestion extends StatelessWidget {
  ReadingQuestion({
    Key? key,
    required this.question,
  }) : super(key: key);

  final TestQuestion question;
  ReadingQsController _readingController = Get.put(ReadingQsController());
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _readingController.pauseGame();
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          'confirm'.tr,
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ),
                        content: Text("Do you want to exit this test?",
                            style: TextStyle(color: greyColor, fontSize: 17)),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _readingController.continueGame();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'cancel'.tr,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _navigationService
                                  .navigateTo(routes.ToiecPage, arguments: {});
                            },
                            child: Text(
                              'exit'.tr,
                              style: TextStyle(color: redColor, fontSize: 18),
                            ),
                          ),
                        ],
                      ));
            },
            icon: const Icon(
              Icons.close,
              size: 25,
            ),
          ),
          backgroundColor: primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Test 1',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                'confirm'.tr,
                                style: TextStyle(
                                    color: primaryColor, fontSize: 20),
                              ),
                              content: Text("Do you want to submit this test?",
                                  style: TextStyle(
                                      color: greyColor, fontSize: 17)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    _readingController.continueGame();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'cancel'.tr,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _navigationService.navigateTo(
                                        routes.ToiecReadingScore,
                                        arguments: {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'submit'.tr,
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ))
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25),
          color: lightPrimaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GetBuilder<ReadingQsController>(
                    init: ReadingQsController(),
                    builder: (controller) {
                      String min1 = "";
                      String sec1 = "";
                      num time =
                          3600 - (controller.animation.value * 3600).round();
                      num hour = time ~/ 3600;
                      num minute = (time % 3600) ~/ 60;
                      minute < 10 ? min1 = "0" : min1 = "";
                      num sec = ((time % 3600) % 60);
                      sec < 10 ? sec1 = "0" : sec1 = "";
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Icon(
                              Icons.alarm,
                              color: Color(0xFFE57373),
                              size: 40,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: favoriteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "0${hour.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: lightOrangeColor,
                                  ),
                                ),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Color(0xFFE57373),
                                ),
                              ),
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: favoriteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "${min1}${minute.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: lightOrangeColor,
                                  ),
                                ),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Color(0xFFE57373),
                                ),
                              ),
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: favoriteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "${sec1}${sec.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: lightOrangeColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ),
              // TimeBar(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    "Question ${_readingController.questionNumber.value}/${_readingController.questions.length}",
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
                    press: () => _readingController.checkAns(question, index),
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
                  onPressed: _readingController.nextQuestion,
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
