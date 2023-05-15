import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/controllers/common/sound_function.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/widgets/sound_bar.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

class WordBox extends StatelessWidget {
  WordBox({Key? key, required this.topic, required  this.index, required this.uId, required this.isFavorited}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  final topic;
  final index;
  final String uId;
  final bool isFavorited;
  List favorites = [];
  Future<void> getFavorite()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: prefs.getString('email')) // add your condition here
        .get();
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};
    favorites = data != null && data is Map<String, dynamic> ? data['favorites'] : [];
  }
  Future<void> updateField(String collectionName, String documentId, String fieldName, dynamic value) async {
    final CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);
    await collection.doc(documentId).update({fieldName: value});
  }

  @override
  Widget build(BuildContext context) {
    int i = index as int;
    if (i < 0) {
      i = 0;
    }
    if (i < topic[0]["word_list"].length) {
      speakNormal(topic[0]["word_list"][i]["vocab"]);
    }
    getFavorite();
    return FutureBuilder<void>(
      future: getFavorite(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the future to complete, you can return a loading indicator
          return CircularProgressIndicator();
        } else {
          // Once the future is complete, you can access the uId and favorites variables
          return Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Confirm",
                              style: TextStyle(
                                  color: primaryColor, fontSize: 20),
                            ),
                            content: Text("Do you want to quit learn vocabulary?",
                                style: TextStyle(
                                    color: greyColor, fontSize: 17)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _navigationService.navigateTo(routes.MainPage, arguments: {} );
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: greenColor, fontSize: 18),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: redColor, fontSize: 18),
                                ),
                              ),
                            ],
                          ));
                    },
                    icon: const Icon(Icons.close),
                    color: primaryColor,
                    padding: const EdgeInsets.only(top: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Confirm",
                              style:
                              TextStyle(color: primaryColor, fontSize: 20),
                            ),
                            content: Text(
                                "Bạn muốn thêm topic vào danh sách yêu thích?",
                                style:
                                TextStyle(color: greyColor, fontSize: 17)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style:
                                  TextStyle(color:  Colors.red, fontSize: 18),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  if (favorites.contains(topic[0]['id'])) {
                                  } else {
                                    favorites.add(topic[0]['id']);
                                    await updateField('users', uId, 'favorites', favorites);
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style:
                                  TextStyle(color: Colors.green, fontSize: 18),
                                ),
                              ),
                            ],
                          ));
                    },
                    padding: EdgeInsets.only(top: 15),
                    icon: const Icon(Icons.favorite),
                    color: isFavorited ? Colors.redAccent : Colors.lightBlue,
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: lightBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.4),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(1, 3),
                          ) // changes position of shadow
                        ],
                      ),
                      child: Padding(

                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                topic[0]["word_list"][i]["word_img_url"],
                                width: 400,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              topic[0]["word_list"][i]["vocab"],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(51, 129, 193, 1),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              topic[0]["word_list"][i]["type"],
                              style: TextStyle(
                                fontSize: 18,
                                color: greyColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              topic[0]["word_list"][i]["pronoun"],
                              style: TextStyle(
                                fontSize: 18,
                                color: greenColor,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              topic[0]["word_list"][i]["meaning"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 105,
              child: SoundBar(iconWidth: 50, space: 40, word: topic[0]["word_list"][i]["vocab"]),
            )
          ]);

          // You can return the rest of your UI code here
          // ...
        }
      },
    );
  }
}
