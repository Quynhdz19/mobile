

import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => QuizPage()));
                  _navigationService.navigateTo(routes.QuizGameQuizPage);
                },
                child: const Text(
                  "START",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  foregroundColor: whiteColor,
                  backgroundColor: lightPrimaryColor,
                  side: BorderSide(color: lightPrimaryColor),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 110),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
