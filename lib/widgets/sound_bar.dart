import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mobile_front_end/utils/constants.dart';

class SoundBar extends StatelessWidget {
  SoundBar(
      {Key? key,
      required this.iconWidth,
      required this.space,
      required this.word})
      : super(key: key);

  final double iconWidth;
  final double space;
  final String word;

  FlutterTts flutterTts = FlutterTts();

  void speakNormal(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  void speakLow(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.15);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              speakNormal(word);
            },
            child: Container(
              width: iconWidth,
              height: iconWidth,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(76, 98, 118, 0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ]),
              child: Image.asset(
                'assets/icons/normal_sound_icon.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: space,
          ),
          GestureDetector(
            onTap: () {
              speakLow(word);
            },
            child: Container(
              width: iconWidth,
              height: iconWidth,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(76, 98, 118, 0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ]),
              child: Image.asset(
                'assets/icons/slow_sound_icon.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
