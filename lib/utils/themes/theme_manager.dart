import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  bool isDark = true;
  get themeMode => _themeMode;

  toggleTheme() {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}