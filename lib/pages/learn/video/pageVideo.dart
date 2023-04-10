import 'package:flutter/material.dart';
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
            padding: EdgeInsets.all(10.0),
            child: Column(
                children: const [
                  const SizedBox(
                    height: 30,
                  ),
                 // TopNaBar(),
                  const SizedBox(
                    height: 30,
                  ),
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