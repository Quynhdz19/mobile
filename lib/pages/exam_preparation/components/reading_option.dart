import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/reading_qs_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';


class ReadingOption extends StatelessWidget {
  ReadingOption({Key? key, required this.choice,
    required this.index,
    required this.press,  required this.answer, required this.selected}) : super(key: key);

  final String choice;
  final int index;
  final VoidCallback press;
  int answer, selected;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReadingQsController>(
        init: ReadingQsController(),
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


          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(12),
              // color: getTheRightColor() == greyColor
              //           ? Colors.transparent
              //           : getTheRightColor(),

              decoration: BoxDecoration(
                color: getTheRightColor() == Colors.black54
                    ? Colors.transparent
                    : getTheRightColor().withOpacity(0.2),
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                    width: (MediaQuery.of(context).size.width - 40),
                    // height: 30,
                    child: Text(
                      choice,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: getTheRightColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
              ),
            ),
          );
        });
  }
}
