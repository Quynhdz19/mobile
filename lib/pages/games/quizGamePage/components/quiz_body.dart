import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
