import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ListenQuestion extends StatefulWidget {
  ListenQuestion({Key? key}) : super(key: key);

  // List<String> options;
  @override
  State<ListenQuestion> createState() => _ListenQuestionState();
}

class _ListenQuestionState extends State<ListenQuestion> {
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

  int? _value = 1;
  List<String> options = ["option 1", "option 2", "option 3", "option 4"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Question 1:",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: primaryColor),
          ),
          const SizedBox(height: 20,),
          Row(
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
                  icon: isPlaying == true ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
              Text(position.inSeconds.toString()),
              Text("/"),
              Text(duration.inSeconds.toString()),
              Slider(
                  activeColor: primaryColor,
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                    await audioPlayer.resume();
                  })
            ],
          ),
          // const SizedBox(height: 20),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/toiec_images%2F1.jpg?alt=media&token=da530d6c-1701-483b-9273-2d6d7c1f664c"),
                  fit: BoxFit.contain),
            ),
          ),
          Column(children: [
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {},
                ),
                const SizedBox(width: 10),
                Text(options[0]),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    _value = value as int?;
                  },
                ),
                const SizedBox(width: 10),
                Text(options[1]),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {},
                ),
                const SizedBox(width: 10),
                Text(options[2]),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {},
                ),
                const SizedBox(width: 10),
                Text(options[3]),
              ],
            )
          ])
        ],
      ),
    );
  }
}
