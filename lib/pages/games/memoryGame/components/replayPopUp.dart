import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/memoryGame/memory_game_page.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

const messages = ['Awesome', 'Fantastic', 'Nice!', 'Great!'];

class ReplayPopUp extends StatelessWidget {
  ReplayPopUp({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final messIndex = Random().nextInt(messages.length);
    String message = messages[messIndex];

    return AlertDialog(
      title: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 5),
          Text(
            "You got 60 points",
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
      content: Image.network(
          "https://as1.ftcdn.net/v2/jpg/03/08/88/18/1000_F_308881850_0P5OOSRUNLbzT2mSiKLHfy6Cg25IBD41.jpg"),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: () {
              _navigationService.navigateTo(routes.GamesPage, arguments: {});
            }, child: Text("Quit"))),
        const SizedBox(
          width: 20,
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => MemoryGamePage()),
                      (route) => false);
                },
                child: Text("Replay")))
      ],
    );
  }
}
