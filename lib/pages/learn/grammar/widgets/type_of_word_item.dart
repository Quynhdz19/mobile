import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/grammar/models/grammar_category.dart';

class TypeOfWordItem extends StatelessWidget {

  final String id;
  final String title;
  final String content;

  TypeOfWordItem({required this.id, required this.title, required this.content});


  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      alignment: Alignment.center,
      child: Card(
        child: ListTile(
          leading: Text(id),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );


  }
}
