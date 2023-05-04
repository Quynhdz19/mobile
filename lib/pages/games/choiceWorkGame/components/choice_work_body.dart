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
                image: AssetImage("assets/images/games/two-way.png")),
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
                  color: Color.fromRGBO(89, 142, 222, 1),
                  fontSize: 24,
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
          width: 140,
          child: ElevatedButton(
            onPressed: _workController.nextQuestion,
            child: Row(
              children: [
                Icon(Icons.navigate_next),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Next",
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
              backgroundColor: Color.fromRGBO(89, 142, 222, 1),
              side: BorderSide(color: Color.fromRGBO(89, 142, 222, 1)),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            ),
          ),
        ),
      ],
    );
  }
}
