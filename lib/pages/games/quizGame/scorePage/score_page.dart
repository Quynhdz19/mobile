import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizgame/question_controller.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/components/score_content.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Quiz Result",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Spacer(flex:2),
          ScoreContent(
            yourScore: _questionController.correctAns * 10,
            totalScore: _questionController.quizzes.length * 10,
            rightAnswer: _questionController.correctAns,
            totalAnswer: _questionController.quizzes.length,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red,),
                      SizedBox(width: 4,),
                      Text(
                        "Quit",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 21,
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
                    backgroundColor: whiteColor,
                    side: BorderSide(color: Colors.red),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.repeat),
                      SizedBox(width: 4,),
                      Text(
                        "Again",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
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
                    backgroundColor: lightPrimaryColor,
                    side: BorderSide(color: lightPrimaryColor),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
                ),
              ]
            ),
          ),
          Spacer(),
        ]
      ),
    );
  }
}
