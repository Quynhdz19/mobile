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
                                      content: Text(
                                          "Do you want to quit learn vocabulary?",
                                          style: TextStyle(
                                              color: greyColor, fontSize: 17)),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            _navigationService.navigateTo(
                                                routes.MainPage,
                                                arguments: {});
                                          },
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(
                                                color: greenColor,
                                                fontSize: 18),
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(28.0, 0.0, 0.0, 0.0),
                          child: Container(
                              child: WordBox(
                            topic: categoriesList,
                            index: index,
                          )),
                        );
                      },
                    ),
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
                            onPressed: () {
                              index++;
                              if (index == categoriesList[0]['words']) {
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
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.keyboard_double_arrow_right),
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 20, horizontal: 10,),
                        //   color: primaryColor,
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
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
