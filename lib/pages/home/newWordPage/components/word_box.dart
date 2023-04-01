import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/widgets/sound_bar.dart';

class WordBox extends StatelessWidget {
  const WordBox({Key? key, required this.topic}) : super(key: key);

  final topic;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: lightBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.4),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(1, 3),
                    ) // changes position of shadow
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        topic["wordList"][0]["englishWord"],
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        topic["wordList"][0]["pronunciation"],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        topic["wordList"][0]["partOfSpeech"],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        topic["wordList"][0]["vietnameseWord"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Positioned(
        top: 20,
        left: 80,
        child: SoundBar(iconWidth: 50, space: 40,),
      )
    ]);
  }
}
