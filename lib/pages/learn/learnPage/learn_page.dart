
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../home/allCategoriesPage/all_categories_page.dart';
import '../video/pageVideo.dart';
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
          'Lessons',
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
                       imageUrl: "https://static.memrise.com/img/400sqf/from/uploads/course_photos/6292806000150729080751.jpg",
                       title: "Learn vocabularies by topic",
                       description: "Typical vocabulary used when...",
                       onPressed: () => {  Navigator.push(  context, MaterialPageRoute(builder: (context) => AllCategoriesPage()))
                       },
                   ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "https://cdn.innovativelanguage.com/members/hungarianpod101/images/learning-paths/original/52_5d6a1f3c3d16b.png",
                    title: "Learn vocabularies by video",
                    description: "Learn vocabularies by video",
                  onPressed: () => {  Navigator.push(  context, MaterialPageRoute(builder: (context) => PageVideo()))
                  },),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "https://play-lh.googleusercontent.com/EyqRWw7xvvDOqibd8zvydRNW9tQyPtCqohJU5uaJqOZ693WYmyGi6tcV2fOtr3sTW6jN",
                    title: "Practice vocabularies",
                    description: "Practice vocabularies description"),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "https://1.bp.blogspot.com/-UMUrKkhaBQw/XRrBPAHnf1I/AAAAAAAAFCE/1DUcZbE9AAw09Lwk59UFlxwo2GTAISNNACLcBGAs/s1600/ENGLISH-GRAMMAR-Basic-English-Grammar-Lessons.png",
                    title: "Basic grammar",
                    description: "Basic grammar description"),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc_ZXHNScVMfplMIQ3V-sCkx6RAar4qNcDBzHhmtZjB7yNjCqwEIbpIlxNJd9uk0rza54&usqp=CAU",
                    title: "Grammar review",
                    description: "Grammar review description"),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
