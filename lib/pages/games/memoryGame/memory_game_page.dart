import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_controller.dart';

import '../../../models/games/memory_word.dart';
import 'components/WordTile.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({Key? key}) : super(key: key);

  @override
  State<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {

  List<MemoryWord> gridWords = [];

  @override
  void initState() {
    setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width_padding = size.width * 0.1;

    return FutureBuilder(
        future: populateSourceWords(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: Something went error");
          } else if (snapshot.hasData) {
            print("source words length ${sourceWords.length}");
            return SafeArea(
              child: Center(
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        left: width_padding, right: width_padding),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: size.height * 0.2),
                    itemBuilder: (context, index) => WordTile(
                          index: index,
                      word: gridWords[index],
                        )),
              ),
            );
          } else {
            print("loading...");
            // final populate = populateSourceWords();
            // populate.then((value) {
            //   print(value);
            // });
            // print(populateSourceWords().toString());
            return CircularProgressIndicator();
          }
        });
  }

  setUp() {
    // sourceWords.shuffle();
    // for (int i = 0; i < 3; i++) {
    //   gridWords.add(sourceWords[i]);
    //   gridWords.add(MemoryWord(text: sourceWords[i].text, url: sourceWords[i].url, displayText: true));
    // }
    // sourceWords.shuffle();
  }
}
