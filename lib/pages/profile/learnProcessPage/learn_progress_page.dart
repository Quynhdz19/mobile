import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/profile/learnProcessPage/components/lineChartWidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'components/statisticComponent.dart';

class LearnProgressPage extends StatefulWidget {
  const LearnProgressPage({Key? key}) : super(key: key);

  @override
  State<LearnProgressPage> createState() => _LearnProgressPageState();
}

class _LearnProgressPageState extends State<LearnProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'learning_process'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "My learning",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 10),
              StatisticComponent(
                imgUrl:
                    "https://thumbs.dreamstime.com/z/set-school-subjects-vector-round-design-cartoon-illustrations-icons-english-reading-maths-art-music-dance-77899227.jpg",
                title: "Learn by topic",
                percentage: "40%",
                color: Colors.red,
                lightColor: Color(0xFFFFCDD2), percent: 0.4,
              ),
              StatisticComponent(
                imgUrl:
                "https://thumbs.dreamstime.com/b/video-camera-icon-comic-style-movie-play-vector-cartoon-illustration-pictogram-video-streaming-business-concept-splash-effect-136144395.jpg",
                title: "Learn by video",
                percentage: "30%",
                color: Colors.yellow,
                lightColor: Color(0xFFFFF9C4), percent: 0.3,
              ),
              StatisticComponent(
                imgUrl: "https://www.shutterstock.com/shutterstock/videos/31059562/thumb/12.jpg?ip=x480",
                title: "Learn grammar",
                percentage: "10%",
                color: Colors.green,
                lightColor: Color(0xFFC8E6C9), percent: 0.1,
              ),
              const SizedBox(height: 20,),
              Text("Learn timeline", style: Theme.of(context).textTheme.headline1,),
              const SizedBox(height:10),
              LineChartWidget(),
            ],
          ),
        ));
  }
}
