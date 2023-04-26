import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';

class VideoPlayerComponent extends StatefulWidget {
  final String name;
  final String videoUrl;
  final String description;

  const VideoPlayerComponent({Key? key,
    required this.name,
    required this.videoUrl,
    required this.description,
  }) : super(key: key);

  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings();
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    )..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
      additionalVideoSources: {
        "720p": _videoPlayerController,
      },
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
        ),
       body : ListView(
        children: [
          Expanded(child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController)),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.description,
                          style: const TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],


          )
    );

  }
}
