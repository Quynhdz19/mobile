import 'package:flutter/cupertino.dart';
import 'package:mobile_front_end/models/learn/flashcard.dart';

class FlashcardManager extends ChangeNotifier {
  Map<int, Flashcard> tappedWords = {};

  bool canFlip = false;

  bool reverseFlip = false;

  bool ignoreTaps = false;

  bool completed = false;

  // int index = 0;
  titleTapped({required int index, required Flashcard flashcard}) {
    ignoreTaps = true;
    if (tappedWords.length <= 1) {
      tappedWords.addEntries([MapEntry(index, flashcard)]);
      canFlip = true;
    } else {
      canFlip = false;
    }

    // this.index = index;
    notifyListeners();
  }
}
