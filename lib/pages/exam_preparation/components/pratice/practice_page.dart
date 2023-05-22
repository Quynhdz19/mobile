import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/all_practice_question.dart';

import '../../../../controllers/common/common_function.dart';
import '../../../../utils/constants.dart';
import '../../../common_component/LeftSideBar.dart';
import '../listen_question.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key, required this.title, required this.jsonPath})
      : super(key: key);

  final String title;
  final String jsonPath;

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  final audioPlayer = AudioPlayer();

  late AudioCache audioCache;

  // AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  Duration duration = Duration.zero;

  Duration position = Duration.zero;

  bool isPlaying = false;

  double currentValue = 20;

  late AudioPlayer advancedPlayer;

  late String audioUrl;

  @override
  void initState() {
    super.initState();

    readData();
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

  Future<void> readData() async {
    final String response = await rootBundle.loadString(widget.jsonPath);
    final data = await json.decode(response);

    print(data);
    questions = data["questions"];
    audioUrl = data["audio_url"];
    print("questions in read data");
    print(questions);
    print(audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
        drawer: LeftSideBar(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Practice",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: primaryColor),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: lightOrangeColor),
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
                const SizedBox(height: 10,),
                AllPracticeQuestion(questions: questions)
              ],
            ),
          ),
        ));
  }
}
