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
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Html(
            data: content,
            style: {
              "html": Style(fontSize: FontSize(16.0)),
              "span": Style(fontWeight: FontWeight.bold),
              "h1": Style(fontSize: FontSize(18.0)),
              "h2": Style(fontSize: FontSize(16.0)),
              "tr": Style(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                padding: EdgeInsets.all(5),
              ),
            }
        ),
      )

    );
  }
}
