import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_controller.dart';
import 'package:mobile_front_end/controllers/game/memoryGame/memory_game_manager.dart';
import 'package:mobile_front_end/models/games/memory_card.dart';
import 'package:mobile_front_end/pages/games/memoryGame/components/replayPopUp.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../controllers/game/matching_game/game_data.dart';
import '../../../models/games/memory_word.dart';
import 'components/WordTile.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class MemoryGamePage extends StatelessWidget {
  MemoryGamePage({Key? key, required this.level}) : super(key: key);

  final Level level;
  // _MemoryGamePageState(level);
  List<MemoryWord> gridWords = [];

  // Level get level => this.level;

  int numberOfCardByLevel(Level level) {
    switch (level) {
      case Level.Easy:
        return 4;
      case Level.Medium:
        return 6;
      case Level.Hard:
        return 8;
    }
  }

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width_padding = size.width * 0.1;

    Future<int> cacheImages() async {
      for (var word in gridWords) {
        final image = Image.network(word.url);
        await precacheImage(image.image, context);
      }
      return 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'matching'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
          leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Confirm",
                      style: TextStyle(
                          color: primaryColor, fontSize: 20),
                    ),
                    content: Text("Do you want to quit game?",
                        style: TextStyle(
                            color: greyColor, fontSize: 17)),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _navigationService.navigateTo(routes.GamesPage, arguments: {});
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: greenColor, fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                              color: redColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ));
            },
            icon: Icon(Icons.close),
          )
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFE8F5E9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChangeNotifierProvider(
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
                                        builder: (context) => ReplayPopUp(
                                              level: this.level,
                                            ));
                                  }
                                });

                                return SafeArea(
                                  child: Column(
                                    children: [
                                      // const SizedBox(height: 10),
                                      // Container(
                                      //   width: 200,
                                      //   height: 100,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //         image: AssetImage(
                                      //             'assets/images/board.png'),
                                      //         fit: BoxFit.cover),
                                      //     borderRadius: BorderRadius.circular(20),
                                      //     border: Border.all(
                                      //         color: Colors.black26, width: 2),
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //         color: Color(0xFFFAFAFA),
                                      //         blurRadius: 0.5,
                                      //         offset:
                                      //             Offset(1, 2), // Shadow position
                                      //       ),
                                      //     ],
                                      //   ),
                                      //   child: Center(
                                      //     child: Text("Score: ${MemoryGameManager.getScore()}" ,
                                      //         style: TextStyle(
                                      //             fontFamily:
                                      //                 GoogleFonts.bubblegumSans()
                                      //                     .fontFamily,
                                      //             fontSize: 26,
                                      //             color: Colors.white,
                                      //             textBaseline:
                                      //                 TextBaseline.alphabetic)),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   // width: 100,
                                      //   // height: 100,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //         image: AssetImage(
                                      //             ""),
                                      //         fit: BoxFit.contain),
                                      //   ),
                                      //   child: Text("Score: 80",
                                      //       style: TextStyle(
                                      //           fontFamily:
                                      //               GoogleFonts.bubblegumSans()
                                      //                   .fontFamily,
                                      //           fontSize: 20,
                                      //           color: Colors.black87,
                                      //           textBaseline:
                                      //               TextBaseline.alphabetic)),
                                      // ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: GridView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(
                                                left: width_padding,
                                                right: width_padding),
                                            itemCount: numberOfCardByLevel(level),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10,
                                                    mainAxisExtent:
                                                        size.height * 0.2),
                                            itemBuilder: (context, index) =>
                                                WordTile(
                                                  index: index,
                                                  word: gridWords[index],
                                                  level: level,
                                                )),
                                      ),
                                    ],
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
          ],
        ),
      ),
    );
  }

  setUp() {
    sourceWords.shuffle();
    int total = (numberOfCardByLevel(level) / 2).toInt();

    for (int i = 0; i < total; i++) {
      gridWords.add(sourceWords[i]);
      gridWords.add(MemoryWord(
          text: sourceWords[i].text,
          url: sourceWords[i].url,
          displayText: true));
    }
    gridWords.shuffle();
  }

  Stream<List<MemoryCard>> readAllCards() => FirebaseFirestore.instance
      .collection('matching-game')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => MemoryCard.fromJson(doc.data())).toList());
}
