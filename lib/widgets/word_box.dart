import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/color.dart';

class WordBox extends StatelessWidget {
  const WordBox({Key? key, required this.topic}) : super(key: key);

  final topic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: lightBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        topic["wordList"][0]["wordImageUrl"],
                        width: 400,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      topic["wordList"][0]["englishWord"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      topic["wordList"][0]["pronunciation"],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      topic["wordList"][0]["partOfSpeech"],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      topic["wordList"][0]["vietnameseWord"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
