import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizgame/question_controller.dart';
import 'package:mobile_front_end/models/Quiz.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_option.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SafeArea(
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/board.png")),
                  ),
                  child: Center(
                    child: Container(
                      width: 180,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          quiz.question,
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                      height: 39,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/qsboard1.png"),
                              fit: BoxFit.fill,
                              scale: 1.2)),
                      child: Obx(
                        () => Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${_controller.questionNumber.value}/${_controller.quizzes.length}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      )),
                  top: 0,
                  left: 140)
            ],
          ),
          Column(
            children: List.generate(
                quiz.options.length,
                (index) => QuizOption(
                      index: index,
                      choice: quiz.options[index],
                      press: () => _controller.checkAns(quiz, index),
                    )),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              onPressed: _controller.nextQuestion,
              child: Row(
                children: [
                  Icon(Icons.navigate_next),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Skip",
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
                backgroundColor: lightPrimaryColor,
                side: BorderSide(color: lightPrimaryColor),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
