import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizgame/question_controller.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_card.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/time_bar.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(children: [
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TimeBar(),
            Expanded(
              child: PageView.builder(
                //block swipe to next qn
                physics: NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                onPageChanged: _questionController.updateTheQnNum,
                itemCount: _questionController.quizzes.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: QuizCard(
                    quiz: _questionController.quizzes[index],
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
