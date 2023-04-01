import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_option.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              quizQuestions[0]["requirement"],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Container(
              width: double.infinity,
              // height: 100,
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  quizQuestions[0]["question"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )),
          const SizedBox(
            height: defaultPadding/2,
          ),
          GridView.count(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(
              quizQuestions[0]["options"].length,
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
