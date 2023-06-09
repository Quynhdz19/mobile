import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_game.dart';
import 'package:mobile_front_end/pages/games/gamesPage/games_page.dart';
import 'package:mobile_front_end/pages/games/memoryGame/memory_game_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/quiz_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/score_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/welcomePage/welcome_page.dart';
import 'package:mobile_front_end/pages/games/matchingGame/matching_menu_page.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/welcomePage/scramble_welcome_page.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/wordPage/scramble_word_page.dart';
import 'package:mobile_front_end/pages/home/homePage/home_page.dart';

import 'package:mobile_front_end/pages/learn/dictionaryPage/dictionary_page.dart';

import 'package:mobile_front_end/pages/learn/practice_vocab/listenAndWritePage/listen_and_write_page.dart';
import 'package:mobile_front_end/pages/learn/vocabByTopic/newWordPage/new_word_page.dart';
import 'package:mobile_front_end/pages/learn/vocabByTopic/topicPage/topic_page.dart';

import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/pages/profile/favoritePage/favorite_page.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/pages/learn/grammar/pages/grammar_page.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/calendar_page.dart';
import 'package:mobile_front_end/pages/ranking/all_user.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import 'package:mobile_front_end/auth/login.dart';

import '../pages/games/choiceWorkGame/choice_work_page.dart';
import '../pages/home/allCategoriesPage/all_categories_page.dart';
import '../pages/learn/learn_page.dart';
import '../pages/learn/topic/topic.dart';
import '../pages/learn/video/components/video_box.dart';
import '../pages/learn/video/pageVideo.dart';
import '../pages/main_page.dart';
import '../pages/profile/learnProcessPage/learn_progress_page.dart';
import '../pages/ranking/ranking_page.dart';
import 'notifi_services.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.allUser:
      return MaterialPageRoute(builder: (context) => AllUser());
    case routes.LoginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    //home
    case routes.HomePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case routes.MainPage:
      return MaterialPageRoute(builder: (context) => MainPage());
    //profile
    case routes.ProfilePage:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case routes.EditProfilePage:
      return MaterialPageRoute(builder: (context) => EditProfilePage());
    case routes.FavoritePage:
      return MaterialPageRoute(builder: (context) => FavoritePage());
    case routes.CalendarPage:
      return MaterialPageRoute(builder: (context) => CalendarPage());
    case routes.RankingPage:
      return MaterialPageRoute(builder: (context) => RankingPage());
    case routes.LearnProgressPage:
      return MaterialPageRoute(builder: (context) => LearnProgressPage());
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
    // choice work page
    case routes.ChoiceWorkPage:
      return MaterialPageRoute(builder: (context) => ChoiceWorkPage());
    case routes.ChoiceWorkGame:
      return MaterialPageRoute(builder: (context) => ChoiceWorkGame(topic: "Feeling"));

      // memory game
    case routes.MemoryGamePage:
      return MaterialPageRoute(builder: (context) => MemoryGamePage());
      //learn
    case routes.GrammarPage:
      return MaterialPageRoute(builder: (context) => GrammarPage());
    case routes.LearningPage:
      return MaterialPageRoute(builder: (context) => LearnPage());
    case routes.LearnCategories:
      return MaterialPageRoute(builder: (context) => AllCategoriesPage());
    case routes.LearnTopic:
      return MaterialPageRoute(builder: (context) => TopicPage());
    case routes.LearnVideo:
      return MaterialPageRoute(builder: (context) => PageVideo());
    case routes.LearnPracticeLW:
      return MaterialPageRoute(builder: (context) => ListenAndWritePage());
    case routes.LearnNewWord:
      return MaterialPageRoute(builder: (context) => NewWordPage());
    case routes.LearnDictionary:
      return MaterialPageRoute(builder: (context) => DictionaryPage());
    case routes.GrammarPage:
      return MaterialPageRoute(builder: (context) => GrammarPage());
    // case routes.GrammarTenseCategoriesPage:
    //   return MaterialPageRoute(builder: (context) => tenseCategoryPage());
    // case routes.GrammarTypesOfWordPage:
    //  return MaterialPageRoute(builder: (context) => typesOfWordPage());
    case routes.AllTopic:
      return MaterialPageRoute(builder: (context) => TopicsPage());
    // case routes.NotificationScreen:
    //   return MaterialPageRoute(builder: (context) => NotificationScreen());
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
