import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizOption extends StatelessWidget {
  const QuizOption ({Key? key, required this.choice, required this.index}) : super(key: key);

  final String choice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 70,
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightBackgroundColor,
      ),
      child: Center(
        child: Text(
          choice,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
