import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ChoiceItem extends StatelessWidget {
  const ChoiceItem(
      {Key? key,
      required this.index,
      required this.press,
      required this.choiceImgUrl,
      required this.choiceContent})
      : super(key: key);

  final String choiceImgUrl;
  final String choiceContent;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoiceWorkController>(
        init: ChoiceWorkController(),
        builder: (workController) {
          Color getTheRightColor() {
            if (workController.isAnswered) {
              if (index == workController.correctAns) {
                return greenColor.withOpacity(0.6);
              } else if (index == workController.selectedAns &&
                  workController.selectedAns != workController.correctAns) {
                return redColor.withOpacity(0.6);
              }
            }
            return Colors.transparent;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == redColor.withOpacity(0.6) ? Icons.close : Icons.done;
          }


          return InkWell(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: getTheRightColor(),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Color.fromRGBO(142, 183, 169, 1), width: 2)),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(choiceImgUrl),
                          fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Color.fromRGBO(142, 183, 169, 1), width: 1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        choiceContent,
                        style: TextStyle(
                            color: scrambleGreenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      getTheRightColor() == Colors.transparent ? Container() : Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          getTheRightIcon(),
                          size: 20,
                          color: whiteColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
