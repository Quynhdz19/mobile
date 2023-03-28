import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/gamesPage/games_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/quiz_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/score_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/welcomePage/welcome_page.dart';
import 'package:mobile_front_end/pages/games/matchingGame/matching_menu_page.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/controllers/game/matching_game/matching_menu_page.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import 'package:mobile_front_end/auth/login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case routes.LoginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
      //profile
    case routes.ProfilePage:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case routes.EditProfilePage:
      return MaterialPageRoute(builder: (context) => EditProfilePage());
      //games
    case routes.GamesPage:
      return MaterialPageRoute(builder: (context) => GamesPage());
      //quizgame
    case routes.QuizGameWelcomePage:
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case routes.QuizGameQuizPage:
      return MaterialPageRoute(builder: (context) => QuizPage());
    case routes.QuizGameScorePage:
      return MaterialPageRoute(builder: (context) => ScorePage());
      //matching game
    case routes.MatchingGameMenu:
      return MaterialPageRoute(builder: (context) => MatchingMenuPage());
      //default
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("No path for ${settings.name}"),)));
  }
}