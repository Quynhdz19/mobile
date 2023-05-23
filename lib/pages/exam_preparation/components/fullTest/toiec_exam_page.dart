import 'package:flutter/material.dart';

import 'package:mobile_front_end/pages/exam_preparation/components/listen_question.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/listen_test.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/reading_part5_test.dart';

import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_qs_controller.dart';

import 'package:mobile_front_end/pages/exam_preparation/components/listen_test.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/reading_part5_test.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;


class ToiecExamPage extends StatelessWidget {
  ToiecExamPage({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();
  ReadingQsController _readingController = Get.put(ReadingQsController());

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
                      child: ReadingPart5Test(
                        question: _readingController.questions[index],
                      ));
                },
              ),
            ),
          );

  }
}
