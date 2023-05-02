
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import 'components/video_box.dart';
import 'components/video_container.dart';
import 'package:mobile_front_end/utils/data/video_data.dart';

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
          children: List.generate(
            videos.length,
                (index) => Padding(
              padding: const EdgeInsets.all(8),
              child: VideoBoxContainer(
                videos: videos[index],
              ),
            ),
          ),
        ),
      )
    );
  }
}

