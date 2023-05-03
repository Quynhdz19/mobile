import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_controller.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_manager.dart';
import 'package:mobile_front_end/models/games/memory_card.dart';
import 'package:mobile_front_end/pages/games/memoryGame/components/replayPopUp.dart';
import 'package:provider/provider.dart';

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
    // setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width_padding = size.width * 0.1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'matching'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

      ),
      body: ChangeNotifierProvider(
        create: (_) => MemoryGameManager(),
        child: FutureBuilder(
            future: populateSourceWords(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error: Something went error");
              } else if (snapshot.hasData) {
                print("source words length ${sourceWords.length}");
                setUp();
                return FutureBuilder(
                  future: cacheImages(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                          "Error: Something went wrong. Check your internet connection");
                    } else if (snapshot.hasData) {
                      return Selector<MemoryGameManager, bool>(
                        selector: (_, gameManager) => gameManager.completed,
                        builder: (_, completed, __) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            if (completed) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => ReplayPopUp());
                            }
                          });

                          return SafeArea(
                            child: Center(
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(
                                      left: width_padding, right: width_padding),
                                  itemCount: 6,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
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
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              } else {
                print("loading...");
                // final populate = populateSourceWords();
                // populate.then((value) {
                //   print(value);
                // });
                // print(populateSourceWords().toString());
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  setUp() {
    sourceWords.shuffle();
    for (int i = 0; i < 3; i++) {
      gridWords.add(sourceWords[i]);
      gridWords.add(MemoryWord(
          text: sourceWords[i].text,
          url: sourceWords[i].url,
          displayText: true));
    }
    gridWords.shuffle();
  }

  Future<int> cacheImages() async {
    for (var word in gridWords) {
      final image = Image.network(word.url);
      await precacheImage(image.image, context);
    }
    return 1;
  }

  Stream<List<MemoryCard>> readAllCards() => FirebaseFirestore.instance
      .collection('matching-game')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => MemoryCard.fromJson(doc.data())).toList());
}
