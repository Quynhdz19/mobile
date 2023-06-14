import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isDark = false;

  bool get isDark => _isDark;
  ThemeMode get themeMode => _themeMode;

  ThemeData _themeData = AppTheme.lightTheme;
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _isDark = !_isDark;
    _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    _themeData = _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
    print(_themeMode);
    print(_themeData.appBarTheme.backgroundColor);
  }
}