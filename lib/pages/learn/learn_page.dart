
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/widgets/icon_widget.dart';
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

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'lessons'.tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: (){
                  _navigationService.navigateTo(routes.LearnDictionary);
                },
              icon: Image.asset(
                "assets/icons/dictionary.png",
                width: 40,
              ),
            ),
          ],
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
                    title: 'learn_by_topic_title'.tr,
                    description: 'learn_by_topic_desc'.tr,
                    onPressed: () { _navigationService.navigateTo(routes.LearnNewWord);},
                ),

                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl: "https://cdn.innovativelanguage.com/members/hungarianpod101/images/learning-paths/original/52_5d6a1f3c3d16b.png",
                    title: 'learn_by_video_title'.tr,
                    description: 'learn_by_video_desc'.tr,
                    onPressed: () { _navigationService.navigateTo(routes.LearnVideo);},
                  ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl:
                        "https://play-lh.googleusercontent.com/EyqRWw7xvvDOqibd8zvydRNW9tQyPtCqohJU5uaJqOZ693WYmyGi6tcV2fOtr3sTW6jN",
                    title: 'practice_vocab_title'.tr,
                    description: 'practice_vocab_desc'.tr,
                    onPressed: () { _navigationService.navigateTo(routes.LearnPracticeLW);},
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                    imageUrl:
                        "https://1.bp.blogspot.com/-UMUrKkhaBQw/XRrBPAHnf1I/AAAAAAAAFCE/1DUcZbE9AAw09Lwk59UFlxwo2GTAISNNACLcBGAs/s1600/ENGLISH-GRAMMAR-Basic-English-Grammar-Lessons.png",
                    title: 'basic_grammar_title'.tr,
                    description: 'basic_grammar_desc'.tr,

                    onPressed: () { _navigationService.navigateTo(routes.GrammarPage);},
               ),

                const SizedBox(
                  height: 30,
                ),
               LearnWidgetsBox(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc_ZXHNScVMfplMIQ3V-sCkx6RAar4qNcDBzHhmtZjB7yNjCqwEIbpIlxNJd9uk0rza54&usqp=CAU",
                    title: 'grammar_review_title'.tr,
                    description: 'grammar_review_desc'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
