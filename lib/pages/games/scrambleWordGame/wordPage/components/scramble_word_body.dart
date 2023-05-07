import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/games/scramble_char.dart';
import 'package:mobile_front_end/models/games/scramble_word.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/ScorePage/scramble_score_page.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:word_search_safety/word_search_safety.dart';
import '../../../../../services/locator.dart';
import '../../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../../../services/route_paths.dart';

class ScrambleWordBody extends StatefulWidget {

  List<ScrambleWord> listScrambleWord;
  ScrambleWordBody(this.listScrambleWord, {Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  State<ScrambleWordBody> createState() => ScrambleWordBodyState();
}

class ScrambleWordBodyState extends State<ScrambleWordBody> {

  late List<ScrambleWord> listScrambleWord;
  int indexQues = 0;
  int hintCount = 0;
  int numCorrectAns = 0;
  bool isFullQuestion = false;

  @override
  void initState() {
    super.initState();
    listScrambleWord = widget.listScrambleWord;
    generatePuzzle();
  }

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {

    ScrambleWord currentQues = listScrambleWord[indexQues];
    setState(() {
      numCorrectAns = listScrambleWord.where((question) => question.isDone).length;
    });


    return Container(
      width: double.maxFinite,
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _navigationService.goBack();
                    },
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                    icon: const Icon(
                    Icons.healing_outlined,
                    size: 30,
                    color: scrambleGreenColor,
                    ),
                  ),

                  Image.asset("assets/images/wordscramblecontent.png",
                  width: 160),
                  Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        generatePuzzle(left: true);
                      },
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: scrambleGreenColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        generatePuzzle(next: true);
                      },
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: scrambleGreenColor,
                      ),
                    ),
                  ],
                  )
                ],
              ),
            ),


            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2),
                  child: Image.network(currentQues.imageUrl,
                  fit: BoxFit.contain),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                currentQues.question,
                style: TextStyle(
                  color: scrambleGreenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 25, 10, 30),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.max,
                    children: currentQues.puzzles.map((puzzle) {

                      Color color;
                      if (puzzle.isReload == true) {
                        color = Color.fromRGBO(253, 160, 145, 1);
                        puzzle.isReload = false;
                      } else {
                        if (currentQues.isDone)
                          color = Colors.green[300]!;
                        else if (puzzle.hintShow)
                          color = Colors.yellow[900]!;
                        else if (currentQues.isFull)
                          color = Colors.red;
                        else
                          color = Color.fromRGBO(253, 160, 145, 1);
                      }


                      return InkWell(
                        onTap: () {
                          if (puzzle.hintShow || currentQues.isDone) return;

                          currentQues.isFull = false;
                          puzzle.clearValue();
                          setState(() {});
                        },

                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: scrambleBoxColor,
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 207, 187, 0.8),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: constraints.biggest.width / 7 - 6,
                          height: constraints.biggest.width / 7 - 6,
                          margin: EdgeInsets.all(3),
                          child: Text(
                            "${puzzle.currentValue ?? ''}".toUpperCase(),
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              alignment: Alignment.center,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 6,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // check xem button day duoc chon chua
                  bool statusBtn = currentQues.puzzles.indexWhere((puzzle) => puzzle.currentIndex == index) >= 0;

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      Color color = statusBtn ? Colors.white70 : scrambleBoxColor;
                      return Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            if (!statusBtn) setBtnClick(index);
                          },
                          child: Text(
                            "${currentQues.arrayBtns[index]}".toUpperCase(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
             //

            //
          ],
        ),
      ),
    );
  }




  void generatePuzzle({
    List<ScrambleWord>? loop,
    bool next: false,
    bool left: false,
  }) {
    // lets finish up generate puzzle
    if (loop != null) {
      indexQues = 0;
      this.listScrambleWord = <ScrambleWord>[];
      this.listScrambleWord.addAll(loop);
    } else {
      if (next && indexQues < listScrambleWord.length - 1)
        indexQues++;
      else if (left && indexQues > 0)
        indexQues--;
      else if (indexQues >= listScrambleWord.length - 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScrambleScorePage(numCorrectAns: numCorrectAns, numQuestion: listScrambleWord.length,),
          ),
        );
      };

      //print(indexQues);
      setState(() {});

      if (this.listScrambleWord[indexQues].isDone) return;
    }
    /*
    if (indexQues >= listScrambleWord.length - 1) {
      setState(() {
        isFullQuestion = true;
      });
    }*/

    ScrambleWord currentQues = listScrambleWord[indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];

    final WSSettings ws = WSSettings(
      width: 12, // total random word row we want use
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );

    final WordSearchSafety wordSearch = WordSearchSafety();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors!.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle!.expand((list) => list).toList();
      currentQues.arrayBtns.shuffle();

      bool isDone = currentQues.isDone;
      bool isFull = currentQues.isFull;
      bool isExist = currentQues.puzzles.where((puzzle) => (puzzle.currentIndex >=0)).toList().length > 0;

      if (!isDone && !isFull && !isExist) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return ScrambleChar(
              correctValue: currentQues.answer.split("")[index],
              currentValue: '',
              currentIndex: -1,
              hintShow: false,
              isReload: false);
        });
      }
    }

    hintCount = 0;
    setState(() {});
  }

  Future<void> setBtnClick(int index) async {
    ScrambleWord currentQues = listScrambleWord[indexQues];
    // o dau tien chua duoc dien chu cai
    int currentIndexEmpty =
    currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == '');

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
      currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);

      }
      setState(() {});
    }
  }

  generateHint() async {

    ScrambleWord currentQues = listScrambleWord[indexQues];
    // list nhung o khong duoc hint va chua duoc dien
    List<ScrambleChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == -1)
        .toList();

    if (puzzleNoHints.length > 0) {
      hintCount++;
      // random so thu tu o duoc hint
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        // o day khong duoc hint va chua duoc dien
        if (!puzzle.hintShow && puzzle.currentIndex == -1) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList(); // update puzzles voi o duoc hint

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      setState(() {});
    }
  }

  void reloadButton() {

    ScrambleWord currentQues = listScrambleWord[indexQues];
    currentQues.puzzles.map((puzzle) {
      puzzle.isReload = true;
      puzzle.hintShow = false;
      puzzle.clearValue();
    }).toList();
    currentQues.isDone = false;
    setState(() {

    });
    print('okila');
  }

}

