import '../models/languages/language_model.dart';

class AppConstants {
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(language_code: "English", language_name: 'en'),
    LanguageModel(language_code: "Vietnamese", language_name: 'vi')
  ];
}