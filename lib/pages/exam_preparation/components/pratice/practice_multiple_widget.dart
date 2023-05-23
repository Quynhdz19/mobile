import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/models/exam/TestComponent.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/practice_option.dart';
import 'package:mobile_front_end/utils/constants.dart';

class PracticeMultipleWidget extends StatelessWidget {
  PracticeMultipleWidget({Key? key, required this.component}) : super(key: key);
  // final NavigationService _navigationService = locator<NavigationService>();
  PracticeController _practiceController = Get.put(PracticeController());
  final TestComponent component;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                      // "Question ${_practiceController.questionNumber.value}/${_practiceController.questions.length}",
                      component.requirement,
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
                // Column(
                //   children: List.generate(
                //     component.questions.length,
                //       (index) => Column(
                //         children: [
                //           Padding(
                //             padding:
                //             const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                //             child: Text(
                //               "${component.questions[index].id + 1}${component.questions[index].question}",
                //               style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w500,
                //                   color: Colors.black87),
                //             ),
                //           ),
                //           SizedBox(
                //             height: 10,
                //           ),
                //           Column(
                //             children: List.generate(
                //               component.questions[index].options.length,
                //                   (i) => PracticeOption(
                //                     indexQs: index,
                //                 index: i,
                //                 choice: component.questions[index].options[i],
                //                 press: () => _practiceController.checkMultipleAns(component.questions[index], i),
                //                 selected: 2,
                //                 answer: 2,
                //               ),
                //             ),
                //           ),
                //         ]
                //       )
                //   )
                // ),

                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                    onPressed: _practiceController.nextPage,
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
          ),
        ));
  }
}
