import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/Quiz.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_option.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget> [
          Center(
            child: Text(
              quiz.requirement,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
              width: double.infinity,
              // height: 100,
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  quiz.question,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4,
                ),
              )),
          SizedBox(
            height: defaultPadding/2,
          ),
          GridView.count(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(
              quiz.options.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: QuizOption(
                  choice: quizQuestions[0]["options"][index],
                  index: index + 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
