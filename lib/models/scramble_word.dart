import 'package:mobile_front_end/models/scramble_char.dart';

class ScrambleWord {
  ScrambleWord({
    required this.question,
    required this.imageUrl,
    required this.answer,
    required this.arrayBtns,
  });
  final String question;
  final String imageUrl;
  final String answer;
  bool isDone = false;
  bool isFull = false;
  List<ScrambleChar> puzzles = <ScrambleChar>[];
  List<String> arrayBtns = <String>[];

  void setScrambleChar(List<ScrambleChar> puzzles) => this.puzzles = puzzles;

  void setIsDone() => this.isDone = true;

  bool fieldCompleteCorrect() {
    bool complete = this.puzzles.where((puzzle) => puzzle.correctValue == '').length == 0;
    if (!complete) {
      //no complete yet
      this.isFull = false;
      return complete;
    }

    this.isFull = true;
    //if already complete, check correct or not
    String answeredString = this.puzzles.map((puzzle) => puzzle.currentValue).join("");

    //if same string, answer is correct
    return answeredString == this.answer;
  }

}