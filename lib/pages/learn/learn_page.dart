
import 'package:flutter/material.dart';

import 'learnPage/components/learn_widgets_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/router.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class LearnPage extends StatelessWidget {
  LearnPage({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lessons',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children:  [
                LearnWidgetsBox(
                    imageUrl:
                        "https://static.memrise.com/img/400sqf/from/uploads/course_photos/6292806000150729080751.jpg",
                    title: "Learn vocabularies by topic",
                    description: "Typical vocabulary used when",
                    onPressed: () { _navigationService.navigateTo(routes.LearnNewWord);},
                ),

                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "https://cdn.innovativelanguage.com/members/hungarianpod101/images/learning-paths/original/52_5d6a1f3c3d16b.png",
                    title: "Learn vocabularies by video",
                    description: "Learn vocabularies by video",
                    onPressed: () { _navigationService.navigateTo(routes.LearnVideo);},
                  ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl:
                        "https://play-lh.googleusercontent.com/EyqRWw7xvvDOqibd8zvydRNW9tQyPtCqohJU5uaJqOZ693WYmyGi6tcV2fOtr3sTW6jN",
                    title: "Practice vocabularies",
                    description: "Practice vocabularies description",
                    onPressed: () { _navigationService.navigateTo(routes.LearnPracticeLW);},
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl:
                        "https://1.bp.blogspot.com/-UMUrKkhaBQw/XRrBPAHnf1I/AAAAAAAAFCE/1DUcZbE9AAw09Lwk59UFlxwo2GTAISNNACLcBGAs/s1600/ENGLISH-GRAMMAR-Basic-English-Grammar-Lessons.png",
                    title: "Basic grammar",
                    description: "Basic grammar description",
                    onPressed: () { _navigationService.navigateTo(routes.GrammarPage);},
               ),
                const SizedBox(
                  height: 30,
                ),
               const LearnWidgetsBox(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc_ZXHNScVMfplMIQ3V-sCkx6RAar4qNcDBzHhmtZjB7yNjCqwEIbpIlxNJd9uk0rza54&usqp=CAU",
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
