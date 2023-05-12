import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChoiceWorkScoreContent extends StatelessWidget {
  const ChoiceWorkScoreContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChoiceWorkController _workController = Get.put(ChoiceWorkController());
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              color: Color.fromRGBO(231, 255, 255, 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 200,
                  child: (_workController.numOfCorrectAns >
                          (_workController.works.length / 2).floor())
                      ? Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_xcz6wutt.json')
                      : Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_ccxfskpm.json'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "YOUR SCORE",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    letterSpacing: 8,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  radius: 80,
                  lineWidth: 20,
                  percent: _workController.numOfCorrectAns /
                      _workController.works.length,
                  progressColor: scrambleGreenColor,
                  backgroundColor: scrambleLightColor,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "${_workController.numOfCorrectAns * 20}",
                            // /${_workController.works.length * 10}
                            style: TextStyle(
                              color: scrambleGreenColor,
                              fontSize: 30,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _workController.numOfCorrectAns == 0
                                ? "point"
                                : "points",
                            style: TextStyle(
                              color: Color.fromRGBO(142, 183, 169, 1),
                              fontSize: 18,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
                  child: Column(
                    children: [
                      Text(
                        (_workController.numOfCorrectAns >
                                (_workController.works.length / 2).floor())
                            ? "Keep up the good work!"
                            : "That was a nice effort!",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: choiceWorkColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
