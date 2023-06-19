import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/score_page.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/listen_practice_page.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/reading_practice_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;


class PracticePage extends StatelessWidget {
  PracticePage({Key? key, required this.pageId, required this.title, required this.jsonPath}) : super(key: key);
  final int pageId;
  final String title;
  final String jsonPath;
  final NavigationService _navigationService = locator<NavigationService>();
  PracticeController _practiceController = Get.put(PracticeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
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
            Text(
              'Practice',
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
                              _navigationService.navigateTo(routes.ToiecPracticeScore, arguments:{});
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
      body: (pageId == 5 || pageId == 6 || pageId == 7) ? ReadingPracticePage(pageId: pageId) : ListenPracticePage(title: title, jsonPath: jsonPath,),
    );
  }
}
