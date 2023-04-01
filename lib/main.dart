import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/ranking/ranking_page.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';


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

  runApp(const MyApp());
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
      home: const RankingPage(),
      // logic cũ SplashPage(),
    );
  }
}
