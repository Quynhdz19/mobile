import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/all_practice_question.dart';

import '../../../../controllers/common/common_function.dart';
import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import '../../../../utils/constants.dart';
import '../../../common_component/LeftSideBar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class I_Lisening extends StatefulWidget {
  const I_Lisening({Key? key, required this.title, required this.jsonPath})
      : super(key: key);

  final String title;
  final String jsonPath;

  @override
  State<I_Lisening> createState() => _I_Lisening();
}

class _I_Lisening extends State<I_Lisening> {
  final audioPlayer = AudioPlayer();

  late AudioCache audioCache;

  // AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  Duration duration = Duration.zero;

  Duration position = Duration.zero;

  bool isPlaying = false;

  double currentValue = 20;

  late AudioPlayer advancedPlayer;

  late String audioUrl;
  final NavigationService _navigationService = locator<NavigationService>();

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

    String url = 'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/audio%2FAT1-10.mp3?alt=media&token=b17f4dd4-72de-4413-b9c8-9e4f6e600ba7';
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

    questions = data["questions"];
    audioUrl = data["audio_url"];
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      drawer: LeftSideBar(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'confirm'.tr,
                      style: TextStyle(color: primaryColor, fontSize: 20),
                    ),
                    content: Text("Do you want to exit this test?",
                        style: TextStyle(color: greyColor, fontSize: 17)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'cancel'.tr,
                          style:
                          TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _navigationService
                              .navigateTo(routes.ToiecPage, arguments: {});
                        },
                        child: Text(
                          'exit'.tr,
                          style: TextStyle(color: redColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ));
            },
            icon: const Icon(
              Icons.close,
              size: 25,
            ),
          ),
          backgroundColor: primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Practice',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'confirm'.tr,
                            style: TextStyle(
                                color: primaryColor, fontSize: 20),
                          ),
                          content: Text("Do you want to submit this test?",
                              style: TextStyle(
                                  color: greyColor, fontSize: 17)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'cancel'.tr,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _navigationService.navigateTo(routes.ToiecPracticeScore, arguments:{});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'submit'.tr,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ))
            ],
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
