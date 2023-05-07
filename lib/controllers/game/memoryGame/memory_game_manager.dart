import 'package:flutter/cupertino.dart';
import 'package:mobile_front_end/controllers/game/matching_game/game_data.dart';

import '../../../models/games/memory_word.dart';
import '../../common/audio_manager.dart';

class MemoryGameManager extends ChangeNotifier {
  Map<int, MemoryWord> tappedWords = {};

  bool canFlip = false;

  bool reverseFlip = false;

  bool ignoreTaps = false;

  bool completed = false;

  int score = 0;

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

  int getScore() {
    return score;
  }

  onAnimationCompleted({required bool isForward, required Level level}) async {
    if (tappedWords.length == 2) {
      if (isForward) {
        if (tappedWords.entries.elementAt(0).value.text ==
            tappedWords.entries.elementAt(1).value.text) {
          answerWords.addAll(tappedWords.keys);

          score += 20;
          if (level == Level.Easy) {
            if (answerWords.length == 4) {
              completed = true;
              await AudioManager.playAudio('round');
              print('all cards matched');
            } else {
              await AudioManager.playAudio('correct');
            }
          } else if (level == Level.Medium) {
            if (answerWords.length == 6) {
              await AudioManager.playAudio('round');
              completed = true;
              print('all cards matched');
            } else {
              await AudioManager.playAudio('correct');
            }

          } else if (level == Level.Hard) {
            if (answerWords.length == 8) {
              completed = true;
              await AudioManager.playAudio('round');
              print('all cards matched');
            } else {
              await AudioManager.playAudio('correct');
            }
          }

          tappedWords.clear();
          canFlip = true;
          ignoreTaps = false;
        } else {
          await AudioManager.playAudio('incorrect');
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
