import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'components/learn_widgets_box.dart';


class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

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
          'Bài học',
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
                   LearnWidgetsBox(
                       imageUrl: "images/multiple-choice.jpeg",
                       title: "Học từ học từ mới theo chủ đề",
                       description: "Học nào anh em ơi"),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "images/multiple-choice.jpeg",
                    title: "Học từ mới video",
                    description: "Học nào anh em ơi"),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "images/multiple-choice.jpeg",
                    title: "Ôn luyện từ mới",
                    description: "Học nào anh em ơi"),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "images/multiple-choice.jpeg",
                    title: "Ngữ pháp cơ bản",
                    description: "Học nào anh em ơi"),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "images/multiple-choice.jpeg",
                    title: "Học từ học từ mới",
                    description: "Học nào anh em ơi"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
