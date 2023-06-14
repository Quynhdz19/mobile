import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/models/exam/TestComponent.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/common_widgets/option.dart';
import 'package:mobile_front_end/utils/constants.dart';

class PracticeOption extends StatelessWidget {
  PracticeOption({Key? key, required this.choice,
    required this.index,
    required this.press,  required this.answer, required this.selected, required this.indexQs, this.component}) : super(key: key);

  TestComponent? component;
  final String choice;
  final int indexQs;
  final int index;
  final VoidCallback press;
  int answer, selected;
  PracticeController _practiceController = Get.put(PracticeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PracticeController>(
        init: PracticeController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.selectedAns) {
                return primaryColor;
              }
            }
            if (answer == 1) {
              return greenColor;
            } else if (answer == 0 && selected == 1) {
              return redColor;
            }
            return Colors.black54;
          }

          return Option(choice: choice, press: press, color: (component?.questions[indexQs].selected_id != 5) ? getTheRightColor() : greyColor);

        });
  }
}
