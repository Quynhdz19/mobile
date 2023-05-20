import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/wordPage/components/scramble_word_body.dart';
import 'package:mobile_front_end/utils/constants.dart';
import '../../../../controllers/common/audio_manager.dart';
import '../../../../models/games/scramble_word.dart';
import '../../../../utils/data/scramble_word_question.dart';

class ScrambleWordPage extends StatefulWidget {
  const ScrambleWordPage({Key? key}) : super(key: key);

  @override
  State<ScrambleWordPage> createState() => _ScrambleWordPageState();
}

class _ScrambleWordPageState extends State<ScrambleWordPage> {
  GlobalKey<ScrambleWordBodyState> globalKey = GlobalKey();
  // late List<ScrambleWord> listScrambleWord;

  @override
  void initState() {
    super.initState();
    // listScrambleWord = ScrambleWordQuestionsSample.map((scrambleword) =>
    //     ScrambleWord(
    //         question: scrambleword["question"],
    //         imageUrl: scrambleword["imageUrl"],
    //         answer: scrambleword["answer"])).toList();
  }

  @override
  Widget build(BuildContext context) {
    // StreamBuilder(
    //   stream: readCards(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final users = snapshot.data!;
    //
    //       List<MemoryCard> listCards = getMemoryGameData() as List<MemoryCard>;
    //
    //       print("List cards");
    //       print(listCards);
    //       return ListView(
    //         children: (users as List<MemoryCard>).map(buildCard).toList(),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Text('Something went wrong');
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // )

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: scrambleBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: readAllWords(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final allWords = snapshot.data!;

                      return Container(
                        //color: scrambleBackgroundColor,
                        child: ScrambleWordBody(
                          (allWords as List<ScrambleWord>)
                              .map((word) => word.create())
                              .toList(),
                          key: globalKey,
                        ),
                      );
                    }
                    else if (snapshot.hasError) {
                      return Text('error'.tr);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          globalKey.currentState!.generatePuzzle(left: true);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_double_arrow_left,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),

                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          foregroundColor: scrambleBackgroundButtonColor,
                          backgroundColor: scrambleBackgroundButtonColor,
                          side: BorderSide(color: scrambleGreenColor),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          globalKey.currentState!.generatePuzzle(next: true);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_double_arrow_right,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),

                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          foregroundColor: scrambleBackgroundButtonColor,
                          backgroundColor: scrambleBackgroundButtonColor,
                          side: BorderSide(color: scrambleGreenColor),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<ScrambleWord>> readAllWords() => FirebaseFirestore.instance
      .collection('scramble-word-game')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ScrambleWord.fromJson(doc.data()))
          .toList());
}
