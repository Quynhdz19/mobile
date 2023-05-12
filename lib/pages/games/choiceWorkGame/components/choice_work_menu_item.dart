import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/models/games/work_topic.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_game.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/choice_work_prepage.dart';

import '../../../../utils/constants.dart';

class ChoiceWorkMenuItem extends StatelessWidget {
  ChoiceWorkMenuItem(
      {Key? key,
      required this.topic})
      : super(key: key);

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
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(topic.imgUrl),
                    fit: BoxFit.fitHeight,
                  ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 185,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: scrambleGreenColor
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      topic.desc,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  // _workController.setWorkTopic(topic.id);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => ChoiceWorkPrePage(
                  //               title: topic.name,
                  //               id: topic.id,
                  //               desc: topic.desc,
                  //             )));
                },
                icon: Icon(Icons.arrow_forward_ios, size: 18, color: scrambleGreenColor,),

              ),
            ],
          ),
      ),
    );
  }
}
