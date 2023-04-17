import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import 'package:flutter_html/flutter_html.dart';


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
      body: SingleChildScrollView(
        child: Html(
            data: content,
          style: {
              "h1": Style(fontSize: FontSize.xLarge),
              "h2,p,li": Style(fontSize: FontSize.large),

          },
        ),
      )

    );
  }
}
