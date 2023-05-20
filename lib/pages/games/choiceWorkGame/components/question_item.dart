import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key, required this.question, required this.qsImgUrl }) : super(key: key);

  final String question, qsImgUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
        question,
          style: TextStyle(
              color: choiceWorkColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10,),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(qsImgUrl)),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: choiceWorkColor,width: 1),
          ),
        ),
      ],
    );
  }
}
