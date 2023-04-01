import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizgame/question_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizOption extends StatelessWidget {
  const QuizOption(
      {Key? key,
      required this.choice,
      required this.index,
      required this.press})
      : super(key: key);

  final String choice;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return greenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return redColor;
              }
            }
            return greyColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == redColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    choice,
                    style: TextStyle(
                        color: getTheRightColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == greyColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == greyColor
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 16,
                            color: whiteColor,
                          ),
                  )
                ],
              ),
            ),
          );
        });
    // return Container(
    //   width: double.infinity,
    //   // height: 70,
    //   margin: EdgeInsets.only(top: defaultPadding),
    //   padding: EdgeInsets.all(defaultPadding),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     color: lightBackgroundColor,
    //   ),
    //   child: Center(
    //     child: Text(
    //       choice,
    //       style: Theme.of(context).textTheme.bodyText1,
    //     ),
    //   ),
    // );
  }
}
