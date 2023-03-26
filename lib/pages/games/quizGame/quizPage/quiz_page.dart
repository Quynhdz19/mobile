import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_body.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: QuizBody(),
    );
  }
}
