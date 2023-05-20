import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_item.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/question_item.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ChoiceWorkBody extends StatelessWidget {
  ChoiceWorkBody({Key? key, required this.work}) : super(key: key);

  final ChoiceWork work;
  ChoiceWorkController _workController = Get.put(ChoiceWorkController());
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        QuestionItem(
          question: work.question[0],
          qsImgUrl: work.question[1]
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/games/arrows.png")),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceItem(
              index: 0,
                press:() => _workController.checkAns(work, 0),
              choiceContent: work.options[0],
              choiceImgUrl: work.options[1]
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "or",
              style: TextStyle(
                  color: choiceWorkColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            ChoiceItem(
              index: 1,
              press: () => _workController.checkAns(work, 1),
              choiceContent: work.options[2],
              choiceImgUrl: work.options[3]
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 160,
          child: ElevatedButton(
            onPressed: _workController.nextQuestion,
            child: Row(
              children: [
                Icon(Icons.keyboard_double_arrow_right),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'next'.tr,
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
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }
}
