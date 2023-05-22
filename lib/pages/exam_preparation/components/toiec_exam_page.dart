import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/listen_question.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/reading_question.dart';

class ToiecExamPage extends StatelessWidget {
  const ToiecExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListenQuestion(),
          ReadingQuestion(
              question:
                  "We would like to discuss this problem honestly and _____ at the next staff meeting.",
              answer: "C",
              options: ["rarely", "tiredly", "openly", "highly"])
        ],
      ),
    ));
  }
}
