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
      // navigation bar
      "home": "Home",
      "learn": "Learn",
      "game": "Game",
      "profile": "Profile",
      // main page
      "welcome_back": "Welcome back!",
      "search_here": "Search here",
      "categories": "Categories",
      "my_favorites": "My Favorites",
      "recommend_for_you": "Recommend for you",
      "new_releases": "New Releases",
      "view_all": "View all",

      // learn page
      "lessons": "Lessons",
      "learn_by_topic_title": "Learn vocabularies by topic",
      "learn_by_topic_desc": "Learn vocabularies by topic description",
      "learn_by_video_title": "Learn vocabularies by video",
      "learn_by_video_desc": "Learn vocabularies by video description",
      "practice_vocab_title": "Practice vocabularies",
      "practice_vocab_desc": "Practice vocabularies description",
      "basic_grammar_title": "Basic grammar",
      "basic_grammar_desc": "Basic grammar description",
      "grammar_review_title": "Grammar review",
      "grammar_review_desc": "Grammar review description",

      // grammar page
      "grammar_point": "Grammar Points",
      "beginner": "Beginner",
      "intermediate": "Intermediate",
      "advanced": "Advanced",
      "learn_now": "Learn Now",

      // game page
      "game_center": "Game Center",
      "quizzes": "Quizzes",
      "quizzes_desc": "Review basic vocabularies and grammars.",
      "matching": "Matching",
      "matching_desc": "Practice reflex and remember vocabularies.",
      "scramble": "Scramble Word",
      "scramble_desc": "Remember the spelling of vocabularies.",
      "choice_work": "Choice Work",
      "choice_work_desc": "Make a decision at a point in time",
      "topic": "Topic",
      "play_now": "Play Now",
      "routine": "Routine",
      "community_behavior": "Commnunity Behavior",
      "feeling": "Feeling",
      "at_home": "At Home",

      // profile page
      "edit_profile": "Edit profile",
      "your_level": "Your level",
      "points": "Points",
      "no_rank": "No Rank",
      "dictionary": "Dictionary",
      "calendar": "Daily Calendar",
      "learning_process": "Learning process",
      "logout": "Logout",

      // edit profile
      "full_name": "Full name",
      "email": "email",
      "edit_fullname": "Edit fullname",
      "edit_phone_number": "Edit phone number",
      "edit": "Edit",
      "cancel": "Cancel",

      "select_language": "Select language",
      "save": "Save",

      "notifications": "Notifications",
      // setting screen
      "settings": "Settings",
      "language": "Language",
      "english": "English",
      "vietnamese": "Vietnamese",
      "favorite_lesson": "Favorite Lessons",
      "phone_number": "Phone number",
      "feedback": "Feedback",
      "night_mode": "Night Mode",

      // ranking screen
      "ranking": "Ranking",
      "score": "Score"
    },
    'vi': {
      // navigation bar
      "home": "Trang chủ",
      "learn": "Bài học",
      "game": "Trò chơi",
      "profile": "Hồ sơ",

      // main page
      "welcome_back": "Chào mừng trở lại!",
      "search_here": "Tìm kiếm tại đây",
      "categories": "Danh mục",
      "my_favorites": "Yêu thích",
      "recommend_for_you": "Gợi ý cho bạn",
      "new_releases": "Mới phát hành",
      "view_all": "Xem tất cả",

      // learn page
      "lessons": "Bài học",
      "learn_by_topic_title": "Học từ vựng theo các chủ đề",
      "learn_by_topic_desc": "Mô tả Học từ vựng theo các chủ đề",
      "learn_by_video_title": "Học từ vựng qua các video",
      "learn_by_video_desc": "Mô tả Học từ vựng qua các video",
      "practice_vocab_title": "Luyện tập từ vựng",
      "practice_vocab_desc": "Mô tả Luyện tập từ vựng",
      "basic_grammar_title": "Ngữ pháp cơ bản",
      "basic_grammar_desc": "Mô tả Ngữ pháp cơ bản",
      "grammar_review_title": "Ôn tập ngữ pháp",
      "grammar_review_desc": "Mô tả Ôn tập ngữ pháp",

      // grammar page
      "grammar_point": "Các chủ đề ngữ pháp",
      "beginner": "Cơ bản",
      "intermediate": "Trung bình",
      "advanced": "Nâng cao",
      "learn_now": "Học Ngay",

      // game page
      "game_center": "Trung tâm trò chơi",
      "quizzes": "Câu đố",
      "quizzes_desc": "Ôn tập từ vựng và ngữ pháp cơ bản",
      "matching": "Ghi nhớ",
      "matching_desc": "Luyện phản xạ và ghi nhớ từ vựng",
      "scramble": "Ghép từ",
      "scramble_desc": "Ghi nhớ cách đánh vần của từ vựng",
      "choice_work": "Quyết định",
      "choice_work_desc": "Đưa ra quyết định tại một thời điểm",
      "topic": "Chủ đề",
      "play_now": "Chơi Ngay",
      "routine": "Sinh hoạt hàng ngày",
      "community_behavior": "Ứng xử nơi công cộng",
      "feeling": "Cảm xúc",
      "at_home": "Công việc ở nhà",
      // profile page

      "edit_profile": "Chỉnh sửa hồ sơ",
      "your_level": "Trình độ của bạn",
      "points": "Điểm",
      "no_rank": "Không có xếp hạng",
      "dictionary": "Từ điển",
      "calendar": "Lịch hàng ngày",
      'learning_process': "Quá trình học tập",
      "notifications": "Thông báo",
      "logout": "Đăng xuất",

      // edit profile
      "full_name": "Tên đầy đủ",
      "email": "Thư điện tử",
      "edit_fullname": "Chỉnh sửa tên đầy đủ",
      "edit_phone_number": "Chỉnh sửa số điện thoại",
      "edit": "Chỉnh sửa",
      "cancel": "Huỷ bỏ",

      "select_language": "Chọn ngôn ngữ",
      "save": "Lưu lại",
      // setting screen
      "settings": "Cài đặt",
      "favorite_lesson": "Bài học yêu thích",
      "phone_number": "Số điện thoại",
      "feedback": "Phản hồi",
      "language": "Ngôn ngữ",
      "english": "Tiếng Anh",
      "vietnamese": "Tiếng Việt",
      "night_mode": "Chế độ tối",

      // ranking screen
      "ranking": "Xếp hạng",
      "score": "Điểm số"
    }
  };

}