import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocaleString extends Translations {
  late final english_data;
  late final vnese_data;

  Future<void> readJson() async {
    final String en_response = await rootBundle.loadString('assets/languages/en.json');
    english_data = await json.decode(en_response);
    final String vi_response = await rootBundle.loadString('assets/languages/vi.json');
    vnese_data = await json.decode(vi_response);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      "select_language": "Select language",
      "save": "Save",
      "home": "Home",
      "notifications": "Notifications",
      // setting screen
      "settings": "Settings",
      "language": "Language",
      "english": "English",
      "vietnamese": "Vietnamese",
      "favorite_lesson": "Favorite Lessons",
      "phone_number": "Phone number",
      "feedback": "Feedback",
      // profile page
      "dictionary": "Dictionary",
      'learning_process': "Learning process",
      "logout": "Logout"
    },
    'vi': {
      "select_language": "Chọn ngôn ngữ",
      "save": "Lưu lại",
      "home": "Trang chủ",
      "notifications": "Thông báo",
      // setting screen
      "settings": "Cài đặt",
      "favorite_lesson": "Bài học yêu thích",
      "phone_number": "Số điện thoại",
      "feedback": "Phản hồi",
      "language": "Ngôn ngữ",
      "english": "Tiếng Anh",
      "vietnamese": "Tiếng Việt",
      // profile page
      "dictionary": "Từ điển",
      'learning_process': "Quá trình học tập",
      "logout": "Đăng xuất"
    }
  };

}