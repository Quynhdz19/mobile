
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/pages/games/matchingGame/matching_menu_page.dart';
import 'package:mobile_front_end/widgets/game_menu_item.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();

    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        title: Text(
          'game_center'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                  isDarkMode ? Icons.sunny : Icons.nightlight_round_outlined))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children:  [
                GameMenuItem(
                  imageUrl: "assets/images/multiple-choice.jpeg",
                  title: 'quizzes'.tr,
                  description:
                      // "You will have 30 seconds to choose one of options. If it is the correct answer, your score will plus 10 points.",
                      'quizzes_desc'.tr,
                  onPressed: ()  {
                    _navigationService.navigateTo(routes.QuizGameWelcomePage);
                  } ,
                ),
                const SizedBox(
                  height: 30,
                ),
                GameMenuItem(
                  imageUrl: "assets/images/matching.png",
                  title: 'matching'.tr,
                  description:
                      'matching_desc'.tr,
                  onPressed: () {
                    _navigationService.navigateTo(routes.MatchingGameMenu);
                   },
                ),
                const SizedBox(
                  height: 30,
                ),
                GameMenuItem(
                  imageUrl: "assets/images/scramble_word.jpeg",
                  title: 'scramble'.tr,
                  description:
                      'scramble_desc'.tr,
                  onPressed: () {
                    _navigationService.navigateTo(routes.ScrambleGameWelcomePage);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GameMenuItem(
                  imageUrl: "assets/images/games/choicework.jpeg",
                  title: 'choice_work'.tr,
                  description:
                  'choice_work_desc'.tr,
                  onPressed: () {
                    _navigationService.navigateTo(routes.ChoiceWorkPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

