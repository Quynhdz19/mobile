import 'package:flutter/cupertino.dart';

import '../../../models/games/memory_word.dart';

class MemoryGameManager extends ChangeNotifier {

  Map<int, MemoryWord> tappedWords = {};

  bool canFlip = false;

  bool reverseFlip = false;

  bool ignoreTaps = false;

  bool completed = false;

  List<int> answerWords = [];

  // int index = 0;
  titleTapped({required int index, required MemoryWord word}) {
    ignoreTaps = true;
    if (tappedWords.length <= 1) {
      tappedWords.addEntries([MapEntry(index, word)]);
      canFlip = true;
    } else {
      canFlip = false;
    }

    // this.index = index;
    notifyListeners();
  }

  onAnimationCompleted({required bool isForward}) {
    if (tappedWords.length == 2) {
      if (isForward) {
        if (tappedWords.entries.elementAt(0).value.text == tappedWords.entries.elementAt(1).value.text) {
          answerWords.addAll(tappedWords.keys);
          if (answerWords.length == 6) {
            completed = true;
            print('all cards matched');
          }
          tappedWords.clear();
          canFlip = true;
          ignoreTaps = false;
        } else {
          reverseFlip = true;
        }
      } else {
        reverseFlip = false;
        tappedWords.clear();
        ignoreTaps = false;
      }
    } else {
      canFlip = false;
      ignoreTaps = false;
    }
    notifyListeners();
  }
}