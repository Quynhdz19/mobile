import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/games/memoryGame/memory_game_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../controllers/game/matching_game/game_data.dart';
import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

List messages = ['awesome'.tr, 'fantastic'.tr, 'nice'.tr, 'great'.tr];

class ReplayPopUp extends StatelessWidget {
  ReplayPopUp({Key? key, required this.level}) : super(key: key);

  final Level level;

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final messIndex = Random().nextInt(messages.length);
    String message = messages[messIndex];

    int getPoint(Level level) {
      switch(level) {
        case Level.Easy:
          return 40;
        case Level.Medium:
          return 60;
          case Level.Hard:
            return 80;
      }
    }
    
    return AlertDialog(
      title: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "You got ${getPoint(level)} points",
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
      content: Image.network(
          "https://as1.ftcdn.net/v2/jpg/03/08/88/18/1000_F_308881850_0P5OOSRUNLbzT2mSiKLHfy6Cg25IBD41.jpg"),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
            // padding: EdgeInsets.all(10),
            width:110,
            child: ElevatedButton(onPressed: () {
              _navigationService.navigateTo(routes.GamesPage, arguments: {});
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: Colors.red,size:18),
                  SizedBox(width: 4,),
                  Text(
                    'quit'.tr,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                foregroundColor: whiteColor,
                backgroundColor: whiteColor,
                side: BorderSide(color: Colors.red),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        Container(
            // padding: EdgeInsets.all(10),
            width: 110,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => MemoryGamePage(level: level,)),
                      (route) => false);
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.repeat, size: 18,),
                  SizedBox(width: 4,),
                  Text(
                    'replay'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                foregroundColor: whiteColor,
                backgroundColor: lightPrimaryColor,
                side: BorderSide(color: lightPrimaryColor),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),

            ),),
      ],
    );
  }
}
