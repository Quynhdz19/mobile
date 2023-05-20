import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizGame/qs_controller.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/components/lose_content.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/components/win_content.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:lottie/lottie.dart';

class ScoreContent extends StatelessWidget {
  ScoreContent({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          color: lightBackgroundColor,
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

            // (_questionController.numOfCorrectAns > (_questionController.quizzes.length/2).floor()) ? WinContent(): LoseContent(),
            (_questionController.numOfCorrectAns > (_questionController.quizzes.length/2).floor()) ?
            Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_xldzoar8.json')
                : Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_E1T3VdKAhy.json'),
            SizedBox(
              height: 10,
            ),
            Text(
              "YOUR SCORE",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                letterSpacing: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${_questionController.numOfCorrectAns * 10}/${_questionController.quizzes.length * 10}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Your attempt",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                      TextSpan(
                          text: " ${_questionController.quizzes.length} questions ",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: "and",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ]),
                  ),
                  Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "from that",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                      TextSpan(
                          text: " ${_questionController.numOfCorrectAns} answer ",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: "is correct.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
