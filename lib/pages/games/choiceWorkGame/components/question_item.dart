import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key, required this.question, required this.qsImgUrl }) : super(key: key);

  final String question, qsImgUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
        question,
          style: TextStyle(
              color: Color.fromRGBO(89, 142, 222, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10,),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(qsImgUrl)),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color.fromRGBO(89, 142, 222, 1),width: 1),
          ),
        ),
      ],
    );
  }
}
