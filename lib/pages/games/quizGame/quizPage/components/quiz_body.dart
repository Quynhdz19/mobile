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
    return Stack(
      children: [
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
                  TimeBar(),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Question 1",
                        style: Theme.of(context).textTheme.headline3,
                        children: [
                          TextSpan(
                              text: "/10",
                              style: Theme.of(context).textTheme.headline4),
                        ]),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  SizedBox(height: defaultPadding),
                  // QuizCard(),
                  Expanded(
                    child: PageView.builder(
                          itemCount: _questionController.quizzes.length,
                          itemBuilder: (context, index)
                          { return Container(child: QuizCard(quiz: _questionController.quizzes[index],));},
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),

                    ),
                  ),
                ],
          //     ),
          //   )
          // ],
        ),
      ),
    ]
    );
  }
}
