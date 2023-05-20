import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/constants.dart';

import 'package:mobile_front_end/pages/learn/vocabByTopic/newWordPage/components/word_list.dart';
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
            MaterialPageRoute(builder: (context) => WordList(id: category['id'])),
          );
        },
        child:
        Container(width: 150,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lightBackgroundColor,
              // image: DecorationImage(
              //     image: NetworkImage(
              //         category["image"]
              //     ),
              //     fit: BoxFit.cover
              // ),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.grey.withOpacity(0.3),
              //       spreadRadius: 1,
              //       blurRadius: 1,
              //       offset: const Offset(1, 1))
              // ],
            border: Border.all(color: primaryColor, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(1, 1))
                      ],
                    // border: Border.all(color: primaryColor, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          category["image"]
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            category["name"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  // padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(15, 3, 5, 3),
                          child: Text(
                            "${category["words"]} ${'word'.tr}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                            ),
                          ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.grey,
                        ),

                        child: Icon(
                          Icons.keyboard_double_arrow_right,
                          color: whiteColor,
                        )
                      )
                    ],
                  )

                ),

              ],
            ),
          ),

        )
    );

  }
}
