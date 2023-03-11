import 'package:flutter/material.dart';

import '../../widgets/learn_widgets_box.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                LearnWidgetsBox(
                  imageUrl: "images/multiple-choice.jpeg",
                  title: "Multiple Choices",

                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/matching.png",
                  title: "Matching",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),

                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),
                LearnWidgetsBox(
                  imageUrl: "images/scramble_word.jpeg",
                  title: "Scramble Word",
                ),
                const SizedBox(
                  height: 30,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
