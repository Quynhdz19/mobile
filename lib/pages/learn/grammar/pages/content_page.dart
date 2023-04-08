import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:mobile_front_end/pages/learn/grammar/data.dart";
import 'package:mobile_front_end/pages/learn/grammar/widgets/grammar_category_item.dart';
import "package:mobile_front_end/pages/learn/grammar/widgets/tense_category_item.dart";
import "package:mobile_front_end/pages/learn/grammar/widgets/type_of_word_item.dart";

class ContentPage extends StatelessWidget {


   final String content;
   final String title;

   ContentPage({
      required this.content,
     required this.title,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
