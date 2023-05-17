import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isDark = false;

  bool get isDark => _isDark;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _isDark = !_isDark;
    _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    print(_themeMode);
  }
}