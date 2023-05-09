import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/homepage/home_page.dart';
import 'package:mobile_front_end/pages/learn/vocabByTopic/newWordPage/components/word_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/recomentopic_data.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class NewWordPage extends StatelessWidget {
  final String id;
  NewWordPage({Key? key, required this.id}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  Future<List> getTopics(String id) async {
    final QuerySnapshot categories = await FirebaseFirestore.instance
        .collection('topics')
        .where('id', isEqualTo: id)
        .get();
    return categories.docs.map((doc) => doc.data()).toList();
  }

  PageController _pageController = PageController();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getTopics(id),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final categoriesList = snapshot.data!;
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
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
                              )),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                           index++;
                           if (index == categoriesList[0]['word_list'].length - 1) {
                             _navigationService.navigateTo(routes.Congratulate, arguments: {} );
                           }
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            foregroundColor: whiteColor,
                            backgroundColor: lightPrimaryColor,
                            side: const BorderSide(color: lightPrimaryColor),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 100)),
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100),
                    child: Center(
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
                                  borderRadius: BorderRadius.circular(20)),
                              foregroundColor: whiteColor,
                              backgroundColor: redColor,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 100)),
                          child: const Text(
                            "       SKIP      ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
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
