import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/models/games/work_topic.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_game.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_prepage.dart';

import '../../../../utils/constants.dart';

class ChoiceWorkMenuItem extends StatelessWidget {
  ChoiceWorkMenuItem({Key? key, required this.topic}) : super(key: key);

  final WorkTopic topic;
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _workController.setWorkTopic(topic.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ChoiceWorkPrePage(
                      title: topic.name,
                      id: topic.id,
                      desc: topic.desc,
                    )));
      },
      child: Container(
        width: double.infinity,
        // height: 250,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: Color.fromRGBO(231, 255, 255, 1),
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
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor, width: 0.5),
                image: DecorationImage(
                  image: NetworkImage(topic.imgUrl),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              // width: MediaQuery.of(context).size.width - 185,
              height: 45,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      topic.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: scrambleGreenColor),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  // SizedBox(height: 5),
                  // Text(
                  //   topic.desc,
                  //   style: TextStyle(
                  //       fontSize: 12,
                  //       color: Colors.grey
                  //   ),
                  //   textAlign: TextAlign.center,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            // IconButton(
            //   onPressed: () {
            //     // _workController.setWorkTopic(topic.id);
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (BuildContext context) => ChoiceWorkPrePage(
            //     //               title: topic.name,
            //     //               id: topic.id,
            //     //               desc: topic.desc,
            //     //             )));
            //   },
            //   icon: Icon(Icons.arrow_forward_ios, size: 18, color: scrambleGreenColor,),
            //
            // ),
          ],
        ),
      ),
    );
  }
}
