import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_work_menu_item.dart';

class ChoiceWorkPage extends StatelessWidget {
  const ChoiceWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          image: "assets/images/games/routine.jpeg",
                          title: 'routine'.tr,
                          desc: "routine"),
                      const SizedBox(
                        width: 10,
                      ),
                      ChoiceWorkMenuItem(
                          image: "assets/images/games/manners.jpeg",
                          title: 'community_behavior'.tr,
                          desc: "routine"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ChoiceWorkMenuItem(
                          image: "assets/images/games/feeling.png",
                          title: 'feeling'.tr,
                          desc: "routine"),
                      const SizedBox(
                        width: 10,
                      ),
                      ChoiceWorkMenuItem(
                          image: "assets/images/games/athome.jpeg",
                          title: 'at_home'.tr,
                          desc: "routine"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
