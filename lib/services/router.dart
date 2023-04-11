import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/gamesPage/games_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/quiz_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/score_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/welcomePage/welcome_page.dart';
import 'package:mobile_front_end/pages/games/matchingGame/matching_menu_page.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/welcomePage/scramble_welcome_page.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/wordPage/scramble_word_page.dart';
import 'package:mobile_front_end/pages/home/homePage/home_page.dart';
import 'package:mobile_front_end/pages/learn/grammar/pages/tense_category_page.dart';
import 'package:mobile_front_end/pages/learn/grammar/pages/types_of_word_page.dart';
import 'package:mobile_front_end/pages/learn/listenAndWritePage/listen_and_write_page.dart';
import 'package:mobile_front_end/pages/learn/newWordPage/new_word_page.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/pages/learn/grammar/pages/grammar_page.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import 'package:mobile_front_end/auth/login.dart';

import '../pages/home/allCategoriesPage/all_categories_page.dart';
import '../pages/learn/learn_page.dart';
import '../pages/learn/video/pageVideo.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    //home
    case routes.HomePage:
      return MaterialPageRoute(builder: (context) => HomePage());
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
    //scramble word game
    case routes.ScrambleGameWelcomePage:
      return MaterialPageRoute(builder: (context) => ScrambleWelcomePage());
    case routes.ScrambleGameScrambleWordPage:
      return MaterialPageRoute(builder: (context) => ScrambleWordPage());

    //learn

    case routes.LearningPage:
      return MaterialPageRoute(builder: (context) => LearnPage());
    case routes.LearnCategories:
      return MaterialPageRoute(builder: (context) => AllCategoriesPage());
    case routes.LearnVideo:
      return MaterialPageRoute(builder: (context) => PageVideo());
    case routes.LearnPracticeLW:
      return MaterialPageRoute(builder: (context) => ListenAndWritePage());
    case routes.LearnNewWord:
      return MaterialPageRoute(builder: (context) => NewWordPage());
    case routes.GrammarPage:
      return MaterialPageRoute(builder: (context) => GrammarPage());
    case routes.GrammarTenseCategoriesPage:
      return MaterialPageRoute(builder: (context) => tenseCategoryPage());
    case routes.GrammarTypesOfWordPage:
      return MaterialPageRoute(builder: (context) => typesOfWordPage());
    //default
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text("No path for ${settings.name}"),
          ),
        ),
      );
  }
}
