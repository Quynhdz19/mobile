import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ReadingQuestion extends StatelessWidget {
  const ReadingQuestion(
      {Key? key,
      required this.question,
      // required this.option1,
      // required this.option2,
      // required this.option3,
      // required this.option4,
      required this.answer,
      required this.options})
      : super(key: key);

  final String question;
  // final String option1;
  // final String option2;
  // final String option3;
  // final String option4;
  final List<String> options;
  final String answer;

  @override
  Widget build(BuildContext context) {
    int? _value = 1;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "Question 1:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
            ),
            Text(question),
            Column(children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {},
                  ),
                  const SizedBox(width: 10),
                  Text(options[0]),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      _value = value as int?;
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(options[1]),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {},
                  ),
                  const SizedBox(width: 10),
                  Text(options[2]),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {},
                  ),
                  const SizedBox(width: 10),
                  Text(options[3]),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
