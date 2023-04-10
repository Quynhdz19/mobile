import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizGame/question_controller.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/quiz_page.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    // QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: IconButton(
                onPressed: () {
                  _navigationService.goBack();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 40,
                  color: primaryColor,
                ),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/welcome.png",
                  width: 240,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "assets/images/quizgame_1.png",
                  width: MediaQuery.of(context).size.width - 20,
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _navigationService.navigateTo(routes.QuizGameQuizPage);
                },
                // onPressed: _controller.startGame,
                child: const Text(
                  "START",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  foregroundColor: whiteColor,
                  backgroundColor: lightPrimaryColor,
                  side: BorderSide(color: lightPrimaryColor),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 110),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
