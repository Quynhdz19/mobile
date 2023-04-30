import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_body.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: QuizBody(),
    );
  }
}
