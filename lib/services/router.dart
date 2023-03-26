import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/quiz_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/score_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/welcomePage/welcome_page.dart';
import 'package:mobile_front_end/pages/games/matchingGame/matching_menu_page.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case routes.QuizGameWelcomePage:
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case routes.QuizGameQuizPage:
      return MaterialPageRoute(builder: (context) => QuizPage());
    case routes.QuizGameScorePage:
      return MaterialPageRoute(builder: (context) => ScorePage());
    case routes.MatchingMenuPage:
      return MaterialPageRoute(builder: (context) => MatchingMenuPage());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("No path for ${settings.name}"),)));
  }
}