import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_work_menu_item.dart';

class ChoiceWorkPage extends StatelessWidget {
  ChoiceWorkPage({Key? key}) : super(key: key);
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChoiceWorkController>(
        init: ChoiceWorkController(),
        initState: (_) {},
        builder: (_) {
          _workController.getTopics();
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Choice Work Game',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // actions: [
                //   IconButton(
                //       onPressed: () {},
                //       icon: Icon(
                //           isDarkMode ? Icons.sunny : Icons.nightlight_round_outlined))
                // ],
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'topic'.tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ChoiceWorkMenuItem(
                              id: "routine",
                              image: "assets/images/games/routine.jpeg",
                              title: 'routine'.tr,
                              desc: "have good habits",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ChoiceWorkMenuItem(
                              id: "behavior",
                              image: "assets/images/games/manners.jpeg",
                              title: 'community_behavior'.tr,
                              desc: "behave properly with people",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ChoiceWorkMenuItem(
                              id: "feeling",
                              image: "assets/images/games/feeling.png",
                              title: 'feeling'.tr,
                              desc: "control your emotion",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ChoiceWorkMenuItem(
                              id: "home",
                              image: "assets/images/games/athome.jpeg",
                              title: 'at_home'.tr,
                              desc: "have regular work at home",
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
