import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/ReviewQuestion.dart';
import 'package:mobile_front_end/pages/learn/reviewMultipleChoicesPage/components/option.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.reviewQuestion})
      : super(key: key);

  // final ReviewQuestion reviewQuestion;
  final reviewQuestion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Center(
            child: Text(
              reviewQuestion["requirement"],
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
              width: double.infinity,
              // height: 100,
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  reviewQuestion["question"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4,
                ),
              )),
          SizedBox(
            height: defaultPadding,
          ),
          ...List.generate(
              reviewQuestion["options"].length,
              (index) => Option(
                  choice: reviewQuestion["options"][index], index: index + 1))
        ],
      ),
    );
  }
}
