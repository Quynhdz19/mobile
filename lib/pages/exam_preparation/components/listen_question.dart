import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListenQuestion extends StatelessWidget {
  ListenQuestion({Key? key}) : super(key: key);

  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  @override
  void initState() {
    // super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  String url = '';
                  // await audioPlayer.play(url);
                }
              }, icon: Icon(Icons.play_arrow)),
              Text(position.toString()),
              Text("/"),
              Text(duration.toString()),
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {

                  })
            ],
          )
        ],
      ),
    );
  }
}
