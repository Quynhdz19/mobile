import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizGame/qs_controller.dart';
import 'package:mobile_front_end/pages/games/quizGame/scorePage/components/score_content.dart';
import 'package:mobile_front_end/pages/games/quizGame/welcomePage/welcome_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ScorePage extends StatelessWidget {
  ScorePage({Key? key}) : super(key: key);
  QuestionController _controller = Get.put(QuestionController());
  final NavigationService _navigationService = locator<NavigationService>();
  Map<dynamic, dynamic> ?myList = null;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Quiz Result",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Spacer(flex:2),
          // WinContent(),
          ScoreContent(),
          Spacer(),
          Padding(

            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigationService.navigateTo(routes.GamesPage, arguments: myList!);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red,),
                      SizedBox(width: 4,),
                      Text(
                        "Give up",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
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
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigationService.navigateTo(routes.QuizGameWelcomePage, arguments: myList!);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.repeat),
                      SizedBox(width: 4,),
                      Text(
                        "Replay",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  ),
                ),
              ]
            ),
          ),
          Spacer(),
        ]
      ),
    );
  }
}
