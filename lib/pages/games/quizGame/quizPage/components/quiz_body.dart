import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/quizGame/qs_controller.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_card.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/time_bar.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class QuizBody extends StatelessWidget {
  QuizBody({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(children: [
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBackgroundColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _questionController.pauseGame();
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "Confirm",
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 20),
                                    ),
                                    content: Text("Do you want to quit game?",
                                        style: TextStyle(
                                            color: greyColor, fontSize: 17)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          _navigationService.navigateTo(routes.GamesPage);
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              color: greenColor, fontSize: 18),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _questionController.continueGame();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              color: redColor, fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 18,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Quizzes",
                      style: TextStyle(
                          fontSize: 20,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
            ),
            Divider(
              color: greyColor.withOpacity(0.3),
            ),
            TimeBar(),
            Expanded(
              child: PageView.builder(
                //block swipe to next qn
                physics: NeverScrollableScrollPhysics(),
                controller: _questionController.pageController,
                onPageChanged: _questionController.updateTheQnNum,
                itemCount: _questionController.quizzes.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: QuizCard(
                    quiz: _questionController.quizzes[index],
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
