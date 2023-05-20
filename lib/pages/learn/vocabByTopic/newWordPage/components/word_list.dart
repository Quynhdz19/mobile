import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/pages/learn/vocabByTopic/newWordPage/components/word_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../../../services/locator.dart';
import '../../../../../services/navigation_service.dart';
import '../../../../../utils/constants.dart';
import '../../../../common_component/LeftSideBar.dart';
import '../new_word_page.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final NavigationService _navigationService = locator<NavigationService>();

  Future<List> getTopics(String id) async {
    final QuerySnapshot categories = await FirebaseFirestore.instance
        .collection('topics')
        .where('id', isEqualTo: id)
        .get();
    print("get topics");
    categories.docs.map((doc) => print(doc.data()));
    print(categories.docs);
    return categories.docs.map((doc) => doc.data()).toList();
  }

  int score = 0;
  String uId = '';
  List arrayFavorite = [];
  bool isFavorite = false;

  Future<void> getScoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email',
            isEqualTo: prefs.getString('email')) // add your condition here
        .get();
    // get data from the first document in the snapshot
    final Object? data =
        snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};
    setState(() {
      score = data != null && data is Map<String, dynamic> ? data['score'] : 0;
      uId = data != null && data is Map<String, dynamic> ? data['uid'] : 0;
      arrayFavorite =
          data != null && data is Map<String, dynamic> ? data['favorites'] : [];
    });
  }

  Future<void> updateField(String collectionName, String documentId,
      String fieldName, dynamic value) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection(collectionName);
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
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("topic"),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewWordPage(id: widget.id)),
                  );
                },
                icon: Icon(Icons.image_outlined),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List>(
          future: getTopics(widget.id),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final categoriesList = snapshot.data!;
                final wordsList = categoriesList[0]["word_list"];
                print(categoriesList[0]["word_list"]);
                if (arrayFavorite.contains(categoriesList[0]['id'])) {
                  isFavorite = true;
                }
                return ListView.builder(
                    // padding: const EdgeInsets.all(8),
                    itemCount: wordsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // height: 200,
                        // color: lightPrimaryColor,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: WordWidget(
                              imageUrl: wordsList[index]['word_img_url'],
                              vocab: wordsList[index]['vocab'],
                              meaning: wordsList[index]['meaning'],
                              pronoun: wordsList[index]['pronoun'],
                              type: wordsList[index]['type'],
                            )
                            // GestureDetector(
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         width: 100,
                            //         height: 250,
                            //         decoration: BoxDecoration(
                            //             image: DecorationImage(
                            //               image: NetworkImage(
                            //                   wordsList[index]['word_img_url']),
                            //               fit: BoxFit.contain,
                            //             ),
                            //             borderRadius: BorderRadius.circular(20)),
                            //       ),
                            //       Column(
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Text(
                            //                 wordsList[index]['vocab'],
                            //                 // style: GoogleFonts.lobster(
                            //                 //     fontSize: 20,
                            //                 //     fontWeight: FontWeight.w600),
                            //               ),
                            //               const SizedBox(width: 10),
                            //               Text(
                            //                 wordsList[index]['type'],
                            //                 // style: GoogleFonts.lobster(
                            //                 //     fontSize: 16,
                            //                 //     fontWeight: FontWeight.w400),
                            //               ),
                            //             ],
                            //           ),
                            //           Text(
                            //             wordsList[index]['pronoun'],
                            //             // style: GoogleFonts.lobster(
                            //             //     fontSize: 16, fontWeight: FontWeight.w500),
                            //           ),
                            //           Text(
                            //             wordsList[index]['meaning'],
                            //             // style: GoogleFonts.lobster(
                            //             //     fontSize: 16,
                            //             //     fontWeight: FontWeight.w500),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            //   onTap: () {
                            //     print("tap $index");
                            //   },
                            // ),
                            ),
                      );
                    });
                // return Column(
                //   children: [
                //     const SizedBox(
                //       height: 40,
                //     ),
                //     Expanded(
                //       child: ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         controller: _pageController,
                //         itemBuilder: (context, index) {
                //           return Padding(
                //             padding:
                //                 const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                //             child: Row(
                //               children: [
                //                 // Text(categoriesList[index]["word_list"])
                //               ],
                //             )
                //             // Container(
                //             // //     child: WordBox(
                //             // //   topic: categoriesList,
                //             // //   index: index,
                //             // //   uId: uId,
                //             // //   isFavorited: isFavorite,
                //             // //   pageId: 1,
                //             // // )),
                //             // )
                //           );
                //         },
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 20,
                //     ),
                //     Padding(
                //       padding:
                //           const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Container(
                //             width: (MediaQuery.of(context).size.width - 80) / 2,
                //             child: ElevatedButton(
                //               onPressed: () {
                //                 index--;
                //                 _pageController.previousPage(
                //                   duration: const Duration(milliseconds: 400),
                //                   curve: Curves.easeInOut,
                //                 );
                //               },
                //               style: ElevatedButton.styleFrom(
                //                   elevation: 0,
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(40)),
                //                   foregroundColor: whiteColor,
                //                   backgroundColor: Colors.red.shade100,
                //                   side: const BorderSide(color: redColor),
                //                   padding: const EdgeInsets.symmetric(
                //                       vertical: 20, horizontal: 0)),
                //               child: Icon(
                //                 Icons.keyboard_double_arrow_left,
                //                 color: redColor,
                //                 size: 25,
                //               ),
                //             ),
                //           ),
                //           Container(
                //             width: (MediaQuery.of(context).size.width - 80) / 2,
                //             child: ElevatedButton(
                //               onPressed: () async {
                //                 index++;
                //                 if (index == categoriesList[0]['words'] - 1) {
                //                   score += categoriesList[0]['score'] as int;
                //                   await updateField('users', uId, 'score', score);
                //                   _navigationService.navigateTo(
                //                       routes.Congratulate,
                //                       arguments: {});
                //                 }
                //                 _pageController.nextPage(
                //                   duration: const Duration(milliseconds: 500),
                //                   curve: Curves.easeInOut,
                //                 );
                //               },
                //               style: ElevatedButton.styleFrom(
                //                 elevation: 0,
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(40)),
                //                 foregroundColor: whiteColor,
                //                 backgroundColor: Colors.green.shade100,
                //                 side: const BorderSide(color: greenColor),
                //                 padding: const EdgeInsets.symmetric(
                //                     vertical: 20, horizontal: 0),
                //               ),
                //               child: Icon(
                //                 Icons.keyboard_double_arrow_right,
                //                 color: greenColor,
                //                 size: 25,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     SizedBox(
                //       height: 90,
                //     ),
                //   ],
                // );
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
      ),
    );
  }
}
