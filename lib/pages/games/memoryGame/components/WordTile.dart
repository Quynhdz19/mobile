import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_manager.dart';
import 'package:mobile_front_end/models/games/memory_card.dart';
import 'package:mobile_front_end/models/games/memory_word.dart';
import 'package:mobile_front_end/pages/games/memoryGame/components/flip_animation.dart';
import 'package:mobile_front_end/pages/games/memoryGame/components/matched_animation.dart';
import 'package:provider/provider.dart';

class WordTile extends StatelessWidget {
  const WordTile({
    Key? key,
    required this.index,
    required this.word,
  }) : super(key: key);

  final int index;
  // final MemoryCard word;
  final MemoryWord word;

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoryGameManager>(builder: (_, notifier, __) {
      bool animate = false;

      if (notifier.canFlip) {
        if (notifier.tappedWords.isNotEmpty &&
            notifier.tappedWords.keys.last == index) {
          animate = true;
        }

        if (notifier.reverseFlip && !notifier.answerWords.contains(index)) {
          animate = true;
        }
      }

      return GestureDetector(
        onTap: () {
          if (!notifier.ignoreTaps &&
              !notifier.answerWords.contains(index) &&
              !notifier.tappedWords.containsKey(index)) {
            notifier.titleTapped(index: index, word: word);
          }
        },
        child: FlipAnimation(
          delay: notifier.reverseFlip ? 500 : 0,
          reverse: notifier.reverseFlip,
          animationComplete: (isForward) {
            notifier.onAnimationCompleted(isForward: isForward);
          },
          animate: animate,
          word: MatchedAnimation(
            animate: notifier.answerWords.contains(index),
            child: Container(
              color: Color(0xFFE1F5FE),
              child: word.displayText
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Text(
                          word.text,
                          style: TextStyle(
                              fontFamily: GoogleFonts.bubblegumSans().fontFamily,
                              fontSize: 40,
                              color: Colors.black87,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ))
                  : Image.network(word.url),
            ),
          ),
        ),
      );
    });
  }
}
