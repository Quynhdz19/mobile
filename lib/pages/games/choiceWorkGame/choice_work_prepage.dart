import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_game.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:lottie/lottie.dart';

class ChoiceWorkPrePage extends StatelessWidget {
  ChoiceWorkPrePage({Key? key, required this.title, required this.id, required this.desc})
      : super(key: key);

  final String title, id, desc;

  final NavigationService _navigationService = locator<NavigationService>();
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoiceWorkController>(
      init: ChoiceWorkController(),
      initState: (_) {},
      builder: (_) {
        _workController.getWorks();
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 235, 201, 0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: IconButton(
                      onPressed: () {
                        _navigationService.goBack();
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 40,
                        color: choiceWorkColor,
                      ),
                    ),
                  ),
                ),

                Lottie.network('https://assets7.lottiefiles.com/packages/lf20_pXvsymFxLM.json'),
                Spacer(),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Play with ${title} Topic",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: scrambleGreenColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "These tips will help you to ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "${desc}",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ]
                      )
                      ),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Let's ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "choose what you will do ",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "for each question.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                      ),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "And ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "do the right thing ",
                              style: TextStyle(
                                color: greenColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "for same situation ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "in reality!",
                              style: TextStyle(
                                color: greenColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                      ),
                      SizedBox(height: 80,),
                      ElevatedButton(
                        onPressed: () {
                          _workController.replayGame();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => ChoiceWorkGame(
                                topicTitle: title,
                                topicId: id,
                              ),
                            ),
                          );
                        },
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          foregroundColor: whiteColor,
                          backgroundColor: choiceWorkColor,
                          side: BorderSide(color: choiceWorkColor),
                          padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 110),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
