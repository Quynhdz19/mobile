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
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Center(
                child: Text(
                  'quiz_result'.tr,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
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
                    _navigationService.navigateTo(routes.GamesPage, arguments: {});
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red,),
                      SizedBox(width: 4,),
                      Text(
                        'quit'.tr,
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
                    _navigationService.navigateTo(routes.QuizGameWelcomePage, arguments: {});
                  },
                  child: Row(
                    children: [
                      Icon(Icons.repeat),
                      SizedBox(width: 4,),
                      Text(
                        'replay'.tr,
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
