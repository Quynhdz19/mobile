import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_front_end/controllers/language/LocaleString.dart';

import 'package:mobile_front_end/services/locator.dart';

import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/notifi_services.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';
import 'package:mobile_front_end/services/router.dart' as router;
import 'package:mobile_front_end/services/route_paths.dart' as routers;
import 'package:mobile_front_end/utils/themes/theme_manager.dart';


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
  // await Settings.init(cacheProvider: SharePreferenceCache());

  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  themeListener() {

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeManager.themeMode,

      // define _locale
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('vi'), // Vietnamese
      ],

      onGenerateRoute: router.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,

      initialRoute: routers.LearningPage
      // ProfilePage,

      // routers.LearnNewWord,




      // routers.QuizGameWelcomePage,
      // home: WelcomePage(),

      // logic cũ SplashPage(),
    );
  }
}
