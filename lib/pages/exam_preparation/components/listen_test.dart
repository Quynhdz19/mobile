import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/listen_question.dart';

import '../../../controllers/common/common_function.dart';
import '../../../utils/constants.dart';

class ListenTest extends StatefulWidget {
  const ListenTest({Key? key}) : super(key: key);

  @override
  State<ListenTest> createState() => _ListenTestState();
}

class _ListenTestState extends State<ListenTest> {
  final audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  // AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  Duration duration = Duration.zero;

  Duration position = Duration.zero;

  bool isPlaying = false;

  double currentValue = 20;

  late AudioPlayer advancedPlayer;

  @override
  void initState() {
    super.initState();

    readListeningData();
    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    String url =
        'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/audio%2Fpart%201.mp3?alt=media&token=a2e77853-f177-4933-a88e-f4749bac08a8';
    audioPlayer.setUrl(url);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  List questions = [];
  Future<void> readListeningData() async {
    final String response =
        await rootBundle.loadString('assets/data/toiec_test.json');
    final data = await json.decode(response);

    setState(() {
      questions = data["questions"];
    });
    // print("questions");
    // print(questions);
  }

  @override
  Widget build(BuildContext context) {
    // readListeningData();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Part 1: Listening test",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20, color: primaryColor),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: lightOrangeColor),
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      // String url = 'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/audio%2Fpart%201.mp3?alt=media&token=a2e77853-f177-4933-a88e-f4749bac08a8';
                      await audioPlayer.resume();
                    }
                  },
                  icon: isPlaying == true
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                ),
                Text(formatTime(position.inSeconds)),
                Text("/"),
                Text(formatTime(position.inSeconds)),
                Slider(
                    activeColor: primaryColor,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    }),
              ],
            ),
          ),
          // ListenQuestion()
        ],
      ),
    );
  }
}
