import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/learn/grammar/models/grammar_category.dart';
import 'package:mobile_front_end/pages/learn/grammar/pages/content_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class GrammarCategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final String example;
  final String content;

  GrammarCategoryItem(
      {required this.image,
      required this.title,
      required this.example,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              height: 48,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          SizedBox(height: 3),
          Text(
            example,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ContentPage(content: content, title: title)));
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              foregroundColor: whiteColor,
              backgroundColor: lightPrimaryColor,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            ),
            child: Text(
              'learn_now'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
