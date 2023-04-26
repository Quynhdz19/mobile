
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import 'components/video_box.dart';
import 'components/video_container.dart';

class PageVideo extends StatefulWidget {
   PageVideo({
    Key? key,
  }) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PageVideo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Text(
          'Video page'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
        body: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(
              height: 30,
            ),
             VideoBoxContainer(
                videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                imgUrl: 'assets/images/video1.jpg',
                title: 'In addition to living. you can also spend the rest of you...',
                description: 'In addition to living. you can also spend the rest of you...',
                time: 'test time',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoPlayerComponent(
                        name: 'In addition to living. you can also spend the rest of you...',
                        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                        description: 'In addition to living. you can also spend the rest of you...',
                    )),
                  );
                },
            ),
            const SizedBox(
              height: 30,
            ),
            VideoBoxContainer(
              videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              imgUrl: 'assets/images/video1.jpg',
              title: 'In addition to living. you can also spend the rest of you...',
              description: 'In addition to living. you can also spend the rest of you...',
              time: 'test time',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VideoPlayerComponent(
                    name: 'In addition to living. you can also spend the rest of you...',
                    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    description: 'In addition to living. you can also spend the rest of you...',
                  )),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            VideoBoxContainer(
              videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              imgUrl: 'assets/images/video1.jpg',
              title: 'In addition to living. you can also spend the rest of you...',
              description: 'In addition to living. you can also spend the rest of you...',
              time: 'test time',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VideoPlayerComponent(
                    name: 'In addition to living. you can also spend the rest of you...',
                    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    description: 'In addition to living. you can also spend the rest of you...',
                  )),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            VideoBoxContainer(
              videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              imgUrl: 'assets/images/video1.jpg',
              title: 'In addition to living. you can also spend the rest of you...',
              description: 'In addition to living. you can also spend the rest of you...',
              time: 'test time',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VideoPlayerComponent(
                    name: 'In addition to living. you can also spend the rest of you...',
                    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    description: 'In addition to living. you can also spend the rest of you...',
                  )),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            VideoBoxContainer(
              videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              imgUrl: 'assets/images/video1.jpg',
              title: 'In addition to living. you can also spend the rest of you...',
              description: 'In addition to living. you can also spend the rest of you...',
              time: 'test time',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VideoPlayerComponent(
                    name: 'In addition to living. you can also spend the rest of you...',
                    videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    description: 'In addition to living. you can also spend the rest of you...',
                  )),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),

          ],
        ),
      )
    );
  }
}

