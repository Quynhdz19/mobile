import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/login.dart';
import 'package:mobile_front_end/pages/splash_page.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashPage(),
    );
  }
}
