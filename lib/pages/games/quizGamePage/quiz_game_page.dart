import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/quizGamePage/components/quiz_body.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizGamePage extends StatelessWidget {
  const QuizGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,

        actions: [
          TextButton(onPressed: (){}, child: Text("Skip")),

        ],
      ),
      body: QuizBody(),
    );
  }
}
