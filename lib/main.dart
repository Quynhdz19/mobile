import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mobile_front_end/services/locator.dart';

import 'package:mobile_front_end/pages/games/quizGame/quizPage/quiz_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/welcomePage/welcome_page.dart';
import 'package:mobile_front_end/pages/home/homePage/home_page.dart';
import 'package:mobile_front_end/pages/home/newWordPage/new_word_page.dart';
import 'package:mobile_front_end/pages/introduction/splash_page.dart';
import 'package:mobile_front_end/pages/learn/learnPage/learn_page.dart';
import 'package:mobile_front_end/pages/learn/listenAndWritePage/listen_and_write_page.dart';
import 'package:mobile_front_end/pages/learn/reviewMultipleChoicesPage/review_multiple_choices_page.dart';
import 'package:mobile_front_end/pages/learn/video/components/top_nabav.dart';
import 'package:mobile_front_end/pages/learn/video/pageVideo.dart';
import 'package:mobile_front_end/pages/main_page.dart';
import 'package:mobile_front_end/pages/ranking/ranking_page.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/score_page.dart';
import 'package:mobile_front_end/pages/ranking/ranking_page.dart';

import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';
import 'package:mobile_front_end/services/router.dart' as router;
import 'package:mobile_front_end/services/route_paths.dart' as routers;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyBkvUiQBpUHf2VMYSgHFdoxyQsHAg2oRkI',
      appId: '1:710602753974:web:a2450949715722bea46317',
      messagingSenderId: '710602753974',
      projectId: 'learnbridge-3cfe6',
      storageBucket: "learnbridge-3cfe6.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      onGenerateRoute: router.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: routers.grammarPage,

      // routers.QuizGameWelcomePage,
      // home: WelcomePage(),

      // logic cũ SplashPage(),
    );
  }
}
