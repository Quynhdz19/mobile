import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../learn/vocabByTopic/newWordPage/new_word_page.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({Key? key, required this.category, this.onPressed})
      : super(key: key);


  final category;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {

    return
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  NewWordPage(id: category['id'])),
          );
        },
        child:
        Container(width: 150,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              color: Colors.black26,
              image: DecorationImage(
                  image: NetworkImage(
                      category["image"]
                  ),
                  fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white54,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      category["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white54,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      "${category["words"]} ${'word'.tr}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),

              ],
            ),
          ),

        )
    );

  }
}
