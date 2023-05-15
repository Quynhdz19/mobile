import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_front_end/controllers/common/clear_script.dart';
import 'package:mobile_front_end/utils/constants.dart';
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
    final re = RegExp(r'Person');
    List<String> sentences = widget.videos['scripts'].split(re);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
          ),
          Container(
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.videos['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Đáp án: ",
                                    style:
                                    TextStyle(color: primaryColor, fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "oke",
                                        style:
                                        TextStyle(color: Colors.green, fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                          padding: EdgeInsets.only(top: 15),
                          icon: const Icon(Icons.favorite),
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 10.0, 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.videos['description'],
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: SingleChildScrollView(
              // alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                // child: Text(
                //   clearScript(widget.videos['scripts']),
                //   style: const TextStyle(fontSize: 14),
                // ),

                child: Column(
                  children: List.generate(
                    sentences.length,
                    (index) => Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: Text(
                          sentences[index].trim(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
