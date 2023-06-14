import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/controllers/common/clear_script.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  List favoritesVideo = [];
  String uId = '';
  Future<void> getFavorite()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: prefs.getString('email')) // add your condition here
        .get();
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};
    favoritesVideo = data != null && data is Map<String, dynamic> ? data['favorites_topic'] : [];
    uId = data != null && data is Map<String, dynamic> ? data['uid'] : [];
  }
  bool checkIsVideo = false;
  void checkIsVideoFavorites()
  {
    setState(() {
      if (favoritesVideo.contains(widget.videos['url'])) {
        checkIsVideo = true;
      } else {
        checkIsVideo = false;
      }
    });

  }
  Future<void> updateFieldVideo(String collectionName, String documentId, String fieldName, dynamic value) async {
    final CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);
    await collection.doc(documentId).update({fieldName: value});
  }


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
    getFavorite();
    checkIsVideoFavorites();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                color: isDarkMode ? darkBackgroundColor : lightBackgroundColor,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
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
                      IconButton(
                          onPressed: () async {
                            checkIsVideoFavorites();
                              if (favoritesVideo.contains(widget.videos['url'])) {

                              } else {
                                favoritesVideo.add(widget.videos['url']);
                                await updateFieldVideo('users', uId, 'favorites_topic', favoritesVideo);
                                checkIsVideo = true;
                              }

                          },
                          padding: EdgeInsets.only(top: 15),
                          icon: const Icon(Icons.favorite),
                          color: checkIsVideo ? Colors.red : Colors.blue,
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
