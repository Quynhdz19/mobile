import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/profile/learnProcessPage/components/lineChartWidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';
import '../../common_component/LeftSideBar.dart';
import 'components/statisticComponent.dart';

class LearnProgressPage extends StatefulWidget {
  const LearnProgressPage({Key? key}) : super(key: key);

  @override
  State<LearnProgressPage> createState() => _LearnProgressPageState();
}

class _LearnProgressPageState extends State<LearnProgressPage> {

  var score = 0;
  var scoreTopics = 0;
  List totalVideo = [];
  var videos = 0;
  var grammar = 0;
  var scorePerent = 0;
  void getDataProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email',
        isEqualTo: prefs.getString('email')) // add your condition here
        .get();

    // get data from the first document in the snapshot
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};

    setState(() {
      score = data != null && data is Map<String, dynamic> ? data['score'] : 0;
      totalVideo = data != null && data is Map<String, dynamic> ? data['favorites_topic'] : '';
    });
  }
  @override
  initState() {
    super.initState();
    getDataProgress();
  }
  @override
  Widget build(BuildContext context) {
    scoreTopics = (score * 100/ 10000).toInt();

    videos = (totalVideo.length *100/ 11).ceil();
    print("videos");
    print(scoreTopics);
    print(videos);
    return Scaffold(
        drawer: LeftSideBar(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'learning_process'.tr,
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              StatisticComponent(
                imgUrl:
                    "https://thumbs.dreamstime.com/z/set-school-subjects-vector-round-design-cartoon-illustrations-icons-english-reading-maths-art-music-dance-77899227.jpg",
                title: 'learn_by_topic'.tr,
                percentage: "${scoreTopics} %",
                color: Colors.green,
                lightColor: Color(0xFFC8E6C9), percent: (scoreTopics/100),
              ),
              StatisticComponent(
                imgUrl:
                "https://thumbs.dreamstime.com/b/video-camera-icon-comic-style-movie-play-vector-cartoon-illustration-pictogram-video-streaming-business-concept-splash-effect-136144395.jpg",
                title: 'learn_by_video'.tr,
                percentage: "${videos} %",
                color: Colors.green,
                lightColor: Color(0xFFC8E6C9), percent: (videos / 100),
              ),
              StatisticComponent(
                imgUrl: "https://www.shutterstock.com/shutterstock/videos/31059562/thumb/12.jpg?ip=x480",
                title: 'learn_grammar'.tr,
                percentage: "10%",
                color: Colors.green,
                lightColor: Color(0xFFC8E6C9), percent: 0.1,
              ),
              StatisticComponent(
                imgUrl:
                "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/ielts.png?alt=media&token=18d7fe3e-1b89-4aed-89d7-34892c2ffd71",
                title: 'proccess ielts'.tr,
                percentage: "${scoreTopics} %",
                color: Colors.green,
                lightColor: Color(0xFFC8E6C9), percent: (scoreTopics/100),
              ),
              StatisticComponent(
                imgUrl:
                "https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/toeic.jpg?alt=media&token=785c98de-b537-4f26-acb3-6c4734061904",
                title: 'proccess topic'.tr,
                percentage: "${scoreTopics} %",
                color: Colors.green,
                lightColor: Color(0xFFC8E6C9), percent: (scoreTopics/100),
              ),
            ],
          ),
        ));
  }
}
