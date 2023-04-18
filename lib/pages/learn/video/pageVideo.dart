import 'package:flutter/material.dart';


import 'components/video_container.dart';

var videoList = [
  {
    'name': 'đi uống bia anh em ơi',
    'video_url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'thumb_url': 'https://static.memrise.com/img/400sqf/from/uploads/course_photos/6292806000150729080751.jpg',
  },
  {
    'name': 'đi uống bia anh em ơi',
    'video_url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'thumb_url': 'https://cdn.innovativelanguage.com/members/hungarianpod101/images/learning-paths/original/52_5d6a1f3c3d16b.png',
  },
  {
    'name': 'đi uống bia anh em ơi',
    'video_url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'thumb_url': 'https://static.memrise.com/img/400sqf/from/uploads/course_photos/6292806000150729080751.jpg',
  },
];


class PageVideo extends StatefulWidget {
  PageVideo({Key? key,}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PageVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Video'),
      ),
      body: ListView(
        children: videoList
            .map((data) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerComponent(
                    name: data['name'] ?? '',
                    videoUrl: data['video_url'] ?? '',
                  ))
                ),
                child: Image.network(data['thumb_url']!),) ).toList(),
      ),
    );
  }
}
