import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/grammar/models/grammar_category.dart';
import 'package:mobile_front_end/pages/learn/grammar/pages/content_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class GrammarCategoryItem extends StatelessWidget {

  final String image;
  final String title;
  final String example;
  final String content;

  GrammarCategoryItem({required this.image,
    required this.title,
  required this.example,
  required this.content});


  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
                    children: [
                      SizedBox(height: 10,),
                      CircleAvatar(
                        backgroundImage:
                        NetworkImage(image),
                        radius: 40,
                      ),
                      SizedBox(height: 30,),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        example,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    ContentPage(content: content, title: title)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Learn Now',
                          ),
                        ),

                    ],
                  ),




    );


  }
}
