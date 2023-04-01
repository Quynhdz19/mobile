import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_card.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/time_bar.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TimeBar(),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text.rich(
                  TextSpan(
                      text: "Question 1",
                      style: Theme.of(context).textTheme.displaySmall,
                      children: [
                        TextSpan(
                            text: "/10",
                            style: Theme.of(context).textTheme.headlineMedium),
                      ]),
                ),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(height: defaultPadding),
                const QuizCard(),
                // Expanded(
                //   child: PageView.builder(
                //     itemBuilder: (context, index) => QuizCard(),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
