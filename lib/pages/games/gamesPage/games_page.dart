
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
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: const Text(
          'Game Center',
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
                  title: "Multiple Choices",
                  description:
                      "This is the description of multiple choice game",
                  onTapFunc: ()  {
                    _navigationService.navigateTo(routes.QuizGameWelcomePage);
                  } ,
                ),
                const SizedBox(
                  height: 30,
                ),
                GameMenuItem(
                  imageUrl: "assets/images/matching.png",
                  title: "Matching",
                  description:
                      "This is the description of multiple choice game",
                  onTapFunc: () {
                    _navigationService.navigateTo(routes.MatchingGameMenu);
                   },
                ),
                const SizedBox(
                  height: 30,
                ),
                GameMenuItem(
                  imageUrl: "assets/images/scramble_word.jpeg",
                  title: "Scramble Word",
                  description:
                      "This is the description of multiple choice game",
                  onTapFunc: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

