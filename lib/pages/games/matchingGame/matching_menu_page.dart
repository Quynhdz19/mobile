import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/matching_game/flip_card_item.dart';
import 'package:mobile_front_end/models/games/game_level.dart';
import 'package:mobile_front_end/pages/games/matchingGame/level_item.dart';
import 'package:mobile_front_end/pages/games/memoryGame/memory_game_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../controllers/game/matching_game/game_data.dart';

class MatchingMenuPage extends StatefulWidget {
  const MatchingMenuPage({Key? key}) : super(key: key);

  @override
  State<MatchingMenuPage> createState() => _MatchingMenuPageState();
}

class _MatchingMenuPageState extends State<MatchingMenuPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    List<GameLevel> gameLevel = [
      GameLevel(
          name: 'easy'.tr,
          mainColor: Color(0xFFE8F5E9),
          imageUrl: "assets/images/games/easy-level.png",
          goto: MemoryGamePage(level: Level.Easy),
          numberStar: 1),
      GameLevel(
          name: 'medium'.tr,
          mainColor: Color(0xFFFFF3E0),
          imageUrl: "assets/images/games/medium-level.png",
          goto: MemoryGamePage(level: Level.Medium),
          numberStar: 2),
      GameLevel(
          name: 'hard'.tr,
          mainColor: Color(0xFFFFEBEE),
          imageUrl: "assets/images/games/hard-level.png",
          goto: MemoryGamePage(level: Level.Hard),
          numberStar: 3),
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(
              'matching_game'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(isDarkMode
                      ? Icons.sunny
                      : Icons.nightlight_round_outlined))
            ],
            leading: IconButton(
              onPressed: () {
                _navigationService.navigateTo(routes.GamesPage, arguments: {});
              },
              icon: Icon(
                Icons.chevron_left,
                size: 25,
              ),
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'choose_level'.tr,
              style: TextStyle(
                  fontSize: 30,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  gameLevel.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  gameLevel[index].goto));
                    },
                    child: LevelItem(
                      imageUrl: gameLevel[index].imageUrl,
                      title: gameLevel[index].name,
                      color: gameLevel[index].mainColor,
                      stars: gameLevel[index].numberStar,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: Stack(
                    //     children: [
                    //       Container(
                    //         height: 100,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             color: gameLevel[index].mainColor,
                    //             borderRadius: BorderRadius.circular(30),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   blurRadius: 4,
                    //                   color: Colors.black45,
                    //                   spreadRadius: 0.5,
                    //                   offset: Offset(3, 4))
                    //             ]),
                    //       ),
                    //       Container(
                    //         height: 90,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(
                    //             // color: gameLevel[index].extraColor,
                    //             borderRadius: BorderRadius.circular(30),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   blurRadius: 4,
                    //                   color: Colors.black12,
                    //                   spreadRadius: 0.3,
                    //                   offset: Offset(5, 3))
                    //             ]),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Center(
                    //                 child: Text(
                    //               gameLevel[index].name,
                    //               style: Theme.of(context).textTheme.headline1,
                    //             )),
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children:
                    //                   generateStar(gameLevel[index].numberStar),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ));
  }

  List<Widget> generateStar(int number) {
    List<Widget> starIcon = [];
    for (int i = 0; i < number; i++) {
      starIcon.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }

    return starIcon;
  }

  Stream<List> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
}
