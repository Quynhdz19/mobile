import 'package:mobile_front_end/models/games/scramble_char.dart';

class ScrambleWord {
  ScrambleWord({
    required this.question,
    required this.imageUrl,
    required this.answer,
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
    //  tinh so luong cac o ma chua co chu cai. Neu bang 0, complete = true, tat ca cac o deu da co chu cai
    bool complete = this.puzzles.where((puzzle) => puzzle.currentValue == '').length == 0;
    if (!complete) {
      //no complete yet
      this.isFull = false;
      return complete;
    }

    this.isFull = true;
    //if already complete, check correct or not. String nay luu gia tri cua cac o theo thu tu
    String answeredString = this.puzzles.map((puzzle) => puzzle.currentValue).join("");

    //if same string, answer is correct
    return answeredString == this.answer;
  }

  ScrambleWord create() {
    return new ScrambleWord(
        question: question,
        imageUrl: imageUrl,
        answer: answer,
    );
  }

  static ScrambleWord fromJson(Map<String, dynamic> word) => ScrambleWord(
    question: word['question'],
    imageUrl: word['imageUrl'],
    answer: word['answer']
  );
}