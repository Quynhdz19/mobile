import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_manager.dart';
import 'package:mobile_front_end/models/games/memory_card.dart';
import 'package:mobile_front_end/models/games/memory_word.dart';
import 'package:mobile_front_end/pages/games/memoryGame/components/flip_animation.dart';
import 'package:mobile_front_end/pages/games/memoryGame/components/matched_animation.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/game/matching_game/game_data.dart';

class WordTile extends StatelessWidget {
  const WordTile({
    Key? key,
    required this.index,
    required this.word, required this.level,
  }) : super(key: key);

  final int index;
  // final MemoryCard word;
  final MemoryWord word;
  final Level level;

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
            notifier.onAnimationCompleted(isForward: isForward, level: level);
          },
          animate: animate,
          word: MatchedAnimation(
            animate: notifier.answerWords.contains(index),
            child: Container(
              // color: Color(0xFFE1F5FE),
              decoration: BoxDecoration(
                color: Color(0xFFE1F5FE),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black26, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFAFAFA),
                    blurRadius: 0.5,
                    offset: Offset(1, 2), // Shadow position
                  ),
                ],
              ),
              child: word.displayText
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Text(
                          word.text,
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.bubblegumSans().fontFamily,
                              fontSize: 40,
                              color: Colors.black87,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ))
                  : Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE1F5FE),
                        image: DecorationImage(
                            image: NetworkImage(word.url), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(color: Colors.black26, width: 2),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color(0xFFFAFAFA),
                        //     blurRadius: 0.5,
                        //     offset: Offset(1, 2), // Shadow position
                        //   ),
                        // ],
                      ),
                      // child: Image.network(word.url)
              ),
            ),
          ),
        ),
      );
    });
  }
}
