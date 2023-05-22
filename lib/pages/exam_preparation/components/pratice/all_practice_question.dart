import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class AllPracticeQuestion extends StatelessWidget {
  AllPracticeQuestion({Key? key, required this.questions}) : super(key: key);

  final List questions;
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            questions.length,
            (index) => Column(children: [
                  Row(
                    children: [
                      Text(
                        "Question",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: primaryColor),
                      ),
                      const SizedBox(width: 10),
                      Text((index + 1).toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor))
                    ],
                  ),
                  const SizedBox(height: 10),
                  questions[index]["question"] == ""
                      ? Container()
                      : Text(questions[index]["question"]),
                  questions[index]["image_url"] == ""
                      ? Container()
                      : Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(questions[index]["image_url"]),
                                fit: BoxFit.contain),
                          ),
                        ),
                  Column(
                    children: List.generate(
                      questions[index]["options"].length,
                      (i) => Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {},
                          ),
                          const SizedBox(width: 10),
                          Text(questions[index]["options"][i]),
                        ],
                      ),
                    ),
                  )
                ])));
  }
}
