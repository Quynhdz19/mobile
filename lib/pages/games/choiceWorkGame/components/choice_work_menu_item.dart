import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_game.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_prepage.dart';

import '../../../../utils/constants.dart';

class ChoiceWorkMenuItem extends StatelessWidget {
  ChoiceWorkMenuItem(
      {Key? key,
      required this.id,
      required this.image,
      required this.title,
      required this.desc})
      : super(key: key);

  final String id;
  final String image;
  final String title;
  final String desc;
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            width: 130,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          // Image(image: AssetImage(image)),
          SizedBox(
            height: 50,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 20,
            child: Text(
              desc,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              _workController.setWorkTopic(id);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ChoiceWorkPrePage(
                            title: title,
                            id: id,
                            desc: desc,
                          )));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text(
              'play_now'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
