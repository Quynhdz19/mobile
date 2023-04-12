import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/learn/video/components/video_container.dart';
import 'dart:io';

import 'components/top_nabav.dart';

class PageVideo extends StatelessWidget {
  const PageVideo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Page Video',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            width: 200, // provide a width
            height: 200,
            padding: EdgeInsets.all(10.0),
            child: Column(
                children:  const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Expanded(
                        child: VideoContainer(videoUrl: 'https://youtu.be/KKc_RMln5UY'),
                    ),
                  ),
                ],
            ),
          ),
        ),

      ),
    );

  }
}