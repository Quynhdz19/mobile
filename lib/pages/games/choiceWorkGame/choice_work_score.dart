import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_prepage.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_work_score_content.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ChoiceWorkScore extends StatelessWidget {
  ChoiceWorkScore({Key? key}) : super(key: key);
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());
  final NavigationService _navigationService = locator<NavigationService>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: choiceWorkBackgroundColor,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: choiceWorkColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      "Result",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(flex:2),
              // WinContent(),
              ChoiceWorkScoreContent(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _navigationService.navigateTo(routes.GamesPage);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.red,),
                            SizedBox(width: 4,),
                            Text(
                              "Quit",
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => ChoiceWorkPrePage(title: _workController.workTopicName, id: _workController.workTopic, desc: _workController.workTopicDesc)));
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
                          backgroundColor: choiceWorkColor,
                          side: BorderSide(color: choiceWorkColor),
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                        ),
                      ),
                    ]
                ),
              ),
              Spacer(),
            ]
        ),
      ),
    );
  }
}
