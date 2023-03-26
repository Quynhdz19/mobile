import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/learn/video/components/video_container.dart';
import 'dart:io';

class PageVideo extends StatelessWidget {
  const PageVideo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          'Pages Video',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
                children: [
                  VideoContainer(
                      videoUrl: 'assets/images/video1.jpg',
                      title: "In addition to living. you can also spend the rest of you...",
                      description: "In addition to living. you can also spend the rest of you...",
                      time: '4:40'),
                  const SizedBox(
                    height: 30,
                  ),
                  VideoContainer(
                      videoUrl: 'assets/images/video2.jpg',
                      title: "In addition to living. you can also spend the rest of you...",
                      description: "In addition to living. you can also spend the rest of you...",
                      time: '4:40'),
                  const SizedBox(
                    height: 30,
                  ),
                  VideoContainer(
                      videoUrl: 'assets/images/video2.jpg',
                      title: "In addition to living. you can also spend the rest of you...",
                      description: "In addition to living. you can also spend the rest of you...",
                      time: '4:40'),
                  const SizedBox(
                    height: 30,
                  ),
                  VideoContainer(
                      videoUrl: 'assets/images/video2.jpg',
                      title: "In addition to living. you can also spend the rest of you...",
                      description: "In addition to living. you can also spend the rest of you...",
                      time: '4:40'),
                  const SizedBox(
                    height: 30,
                  ),
                ],
            ),
          ),
        ),

      ),
    );

  }
}