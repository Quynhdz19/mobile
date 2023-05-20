import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadingQuestion extends StatelessWidget {
  const ReadingQuestion(
      {Key? key,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      required this.answer, required this.options})
      : super(key: key);

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final List<String> options;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(question),
          Column(
            children: []
          )
        ],
      ),
    );
  }
}
