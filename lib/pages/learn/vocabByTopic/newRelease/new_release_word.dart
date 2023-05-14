import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/controllers/common/sound_function.dart';
import 'package:mobile_front_end/pages/home/homepage/home_page.dart';
import 'package:mobile_front_end/pages/learn/vocabByTopic/newWordPage/components/word_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/recomentopic_data.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

class NewReleaseWord extends StatefulWidget {

  NewReleaseWord({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _NewReleaseWord createState() => _NewReleaseWord();
}
class _NewReleaseWord extends State<NewReleaseWord> {
  final NavigationService _navigationService = locator<NavigationService>();
  Future<List> getTopics(String id) async {
    final QuerySnapshot categories = await FirebaseFirestore.instance
        .collection('new-release')
        .where('id', isEqualTo: id)
        .get();
    return categories.docs.map((doc) => doc.data()).toList();
  }
  int score = 0;
  String uId = '';
  Future<void> getScoreUser()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: prefs.getString('email')) // add your condition here
        .get();
    // get data from the first document in the snapshot
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};
    setState(() {
      score = data != null && data is Map<String, dynamic> ? data['score'] : 0;
      uId = data != null && data is Map<String, dynamic> ? data['uid'] : 0;
    });
  }
  Future<void> updateField(String collectionName, String documentId, String fieldName, dynamic value) async {
    final CollectionReference collection = FirebaseFirestore.instance.collection(collectionName);
    await collection.doc(documentId).update({fieldName: value});
  }
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    getScoreUser();
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List>(
        future: getTopics(widget.id),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final categoriesList = snapshot.data!;
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Container(
                              child: WordBox(
                                topic: categoriesList,
                                index: index,
                                pageId: 0,
                              )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 80) / 2,
                          child: ElevatedButton(
                            onPressed: () {
                              index--;
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                foregroundColor: whiteColor,
                                backgroundColor: Colors.red.shade100,
                                side: const BorderSide(color: redColor),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 0)),
                            child: Icon(Icons.keyboard_double_arrow_left, color: redColor, size: 25,),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 80)/2,
                          child: ElevatedButton(
                            onPressed: () async {
                              index++;
                              if (index == categoriesList[0]['words'] - 1) {
                                score += categoriesList[0]['score'] as int;
                                await updateField('users', uId, 'score', score);
                                _navigationService
                                    .navigateTo(routes.Congratulate, arguments: {});
                              }
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              foregroundColor: whiteColor,
                              backgroundColor: Colors.green.shade100,
                              side: const BorderSide(color: greenColor),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 0),
                            ),
                            child: Icon(Icons.keyboard_double_arrow_right, color: greenColor, size: 25,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,

                  ),
                ],
              );
            } else {
              // Handle the case where the future completes with an error.
              return const Center(child: Text('Failed to load categories.'));
            }
          } else {
            // Handle the case where the future is still running.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
