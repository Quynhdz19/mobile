import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/pages/games/matchingGame/matching_menu_page.dart';
import 'package:mobile_front_end/widgets/game_menu_item.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../utils/constants.dart';
import '../../common_component/LeftSideBar.dart';

class GamesPage extends StatelessWidget {
  GamesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();

    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'game_center'.tr,
      //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //             isDarkMode ? Icons.sunny : Icons.nightlight_round_outlined))
      //   ],
      // ),
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('game_center'.tr, style: TextStyle(fontSize: 18)),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    GameMenuItem(
                      imageUrl: "assets/images/quizz.jpg",
                      title: 'quizzes'.tr,
                      description:
                          // "You will have 30 seconds to choose one of options. If it is the correct answer, your score will plus 10 points.",
                          'quizzes_desc'.tr,
                      onPressed: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     });
                        // Future.delayed(Duration(milliseconds: 1000));
                        _navigationService
                            .navigateTo(routes.QuizGameWelcomePage, arguments: {});
                        // Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 20,),
                    GameMenuItem(
                      imageUrl: "assets/images/matching.png",
                      title: 'matching'.tr,
                      description: 'matching_desc'.tr,
                      onPressed: () {
                        _navigationService
                            .navigateTo(routes.MatchingGameMenu, arguments: {});
                      },
                    ),
                    SizedBox(height: 20,),
                    GameMenuItem(
                      imageUrl: "assets/images/scramble_word_logo.jpg",
                      title: 'scramble'.tr,
                      description: 'scramble_desc'.tr,
                      onPressed: () {
                        _navigationService.navigateTo(
                            routes.ScrambleGameWelcomePage,
                            arguments: {});
                      },
                    ),
                    SizedBox(height: 20,),
                    GameMenuItem(
                      imageUrl: "assets/images/games/choicework.jpeg",
                      title: 'choice_work'.tr,
                      description: 'choice_work_desc'.tr,
                      onPressed: () {
                        _navigationService
                            .navigateTo(routes.ChoiceWorkPage, arguments: {});
                      },

                ),
              ],
            ),
          ),
    );
  }
}
