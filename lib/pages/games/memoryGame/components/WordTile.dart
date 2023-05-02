import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/games/memory_word.dart';

class WordTile extends StatelessWidget {
  const WordTile({
    Key? key,
    required this.index,
    required this.word,
  }) : super(key: key);

  final int index;
  final MemoryWord word;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child:
          word.displayText ? Text(index.toString()) : Image.network(word.url),
    );
  }
}
