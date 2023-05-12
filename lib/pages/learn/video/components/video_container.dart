import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_caption_scraper/youtube_caption_scraper.dart';

class VideoPlayerComponent extends StatefulWidget {
  final videos;

  VideoPlayerComponent({Key? key, required this.videos}) : super(key: key);

  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videos['url'],
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.videos['name'],
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.videos['description'],
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.videos['scripts'],
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
