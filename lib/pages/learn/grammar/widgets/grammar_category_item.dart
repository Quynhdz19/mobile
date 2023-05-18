import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return
      GestureDetector(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ContentPage(content: content, title: title)));
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width - 20,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                    image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.headlineMedium,
                            // Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            example,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: lightTextColor,
                                fontFamily: GoogleFonts.poppins().toString(),
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  child: IconButton(
                    icon: Icon(
                      Icons.launch,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ContentPage(content: content, title: title)));
                    },
                  ),
                ),

              ],
            ),
          ),
      );

  }
}
