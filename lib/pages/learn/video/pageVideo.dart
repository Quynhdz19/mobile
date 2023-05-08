
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../home/homePage/components/search_bar.dart';
import 'components/tabar.dart';
import 'components/video_box.dart';
import 'components/video_container.dart';
import 'package:mobile_front_end/utils/data/video_data.dart';

class PageVideo extends StatefulWidget {
  PageVideo({Key? key}) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PageVideo> {
  late Future<List<Map<dynamic, dynamic>>> videosListFuture;

  @override
  void initState() {
    super.initState();
    videosListFuture = getVideos();
  }

  Future<List<Map<dynamic, dynamic>>> getVideos() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('video').get();
    final List<QueryDocumentSnapshot> videos = snapshot.docs;

    return videos.map((video) => video.data() as Map<dynamic, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Videos page'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Map<dynamic, dynamic>>>(
        future: videosListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final videos = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                 TaBar(),
                ...List.generate(
                  videos.length,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: VideoBoxContainer(
                      videos: videos[index],
                    ),
                  ),
                ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching videos'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
