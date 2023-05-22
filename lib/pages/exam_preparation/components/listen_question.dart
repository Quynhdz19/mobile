import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_front_end/controllers/common/common_function.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ListenQuestion extends StatelessWidget {
  ListenQuestion(
      {Key? key,
      required this.question,
      required this.imageUrl,
      required this.options,
      required this.answer})
      : super(key: key);

  final String question;
  final String imageUrl;
  final List<String> options;
  final String answer;
  // List<String> options;
  int? _value = 1;

  List questions = [];

  // Future<void> readListeningData() async {
  @override
  Widget build(BuildContext context) {
    // readListeningData();
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
                  questions[index]["imageUrl"] == ""
                      ? Container()
                      : Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(questions[index]["imageUrl"]),
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
