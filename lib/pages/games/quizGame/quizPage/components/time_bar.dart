import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizGame/qs_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';

class TimeBar extends StatelessWidget {
  const TimeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: greyColor, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      color: (controller.animation.value * 60).round() < 50
                          ? primaryColor
                          : redColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${(controller.animation.value * 60).round()} sec",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Image.asset("assets/images/clockicon.png"),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
