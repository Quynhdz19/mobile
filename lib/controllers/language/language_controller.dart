import 'dart:html';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:mobile_front_end/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/languages/language_model.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {}

  Locale _locale = Locale(AppConstants.languages[0].language_code);

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  List<LanguageModel> _languages = [];
  Locale get locale => _locale;

  List<LanguageModel> get languages => _languages;

  void loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
        AppConstants.languages[0].language_code);

    for(int i=0; i<AppConstants.languages.length; i++) {
      if(AppConstants.languages[i].language_code == _locale.languageCode) {
        _selectedIndex = i;
        break;
      }
    }

    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }
}
