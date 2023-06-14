import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/pages/home/homepage/components/categories_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/favorites_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/recommends_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/releases_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/search_bar.dart';
import 'package:mobile_front_end/pages/home/homePage/components/notification_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../services/notifi_services.dart';
import '../../../utils/constants.dart';
import '../../common_component/LeftSideBar.dart';
import '../allCategoriesPage/components/category_box.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fullname = "";
  var email;
  var documents;

  List filteredCategoriesList = [];

  List categoriesList = [];
  void getTopics() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('topics').get();
    final List<QueryDocumentSnapshot> categories = snapshot.docs;

    categories.forEach((category) {
      Object? data = category.data();
      categoriesList.add(data);
    });
  }


  String uId = '';
  List arrayFavorite = [];
  bool isFavorite = false;
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
      uId = data != null && data is Map<String, dynamic> ? data['uid'] : 0;
      arrayFavorite = data != null && data is Map<String, dynamic> ? data['favorites'] : [];
    });
  }

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    getFullname();
    getTopics();
    filterData();
  }

  final TextEditingController _searchKeyWords = TextEditingController();
  void getFullname() async {
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
      fullname = data != null && data is Map<String, dynamic>
          ? data['fullname']
          : 'Chào bạn!';
    });
  }

  void filterData() {
    if (_searchKeyWords.text != "") {
      filteredCategoriesList = filteredCategoriesList
          .where((category) => category['name']
          .toLowerCase()
          .contains(_searchKeyWords.text.toLowerCase()))
          .toList();
    } else {
        filteredCategoriesList = categoriesList; // assign the original list
    }
  }

  List namesIcon = [
    "Categories",
    "Lesson",
    "Video",
    "Toeic & Ielts",
    "Games",
    "Proccess",
  ];

  List<Color> namesColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
    Color(0xFFCB84F8),
    Color(0xFF78E667),
  ];

  List<Icon> nameIcons = [
    Icon(Icons.category, color: Colors.white, size: 25),
    Icon(Icons.play_lesson, color: Colors.white, size: 25),
    Icon(Icons.play_circle, color: Colors.white, size: 25),
    Icon(Icons.topic, color: Colors.white, size: 25),
    Icon(Icons.games, color: Colors.white, size: 25),
    Icon(Icons.auto_graph, color: Colors.white, size: 25),
  ];

  void nextPage(String name) {
    switch (name) {
      case "Categories":
        _navigationService.navigateTo(routes.AllTopic, arguments: {});
        break;
      case "Lesson":
        _navigationService.navigateTo(routes.LearningPage, arguments: {});
        break;
      case "Video":
        _navigationService.navigateTo(routes.LearnVideo, arguments: {});
        break;
      // case "Toeic & Ielts":
      //   _navigationService.navigateTo(routes.LearnVideo, arguments: {});
      //   break;
      case "Games":
        _navigationService.navigateTo(routes.GamesPage, arguments: {});
        break;
      case "Proccess":
        _navigationService.navigateTo(routes.LearnProgressPage, arguments: {});
        break;

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text('home'.tr, style: TextStyle(fontSize: 18),),
      ),
      body: buildHomePageBody(context),
    );
  }
  Widget buildHomePageBody(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: isDarkMode ? darkBackgroundColor : lightPrimaryColor),
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: isDarkMode ? darkBackgroundColor : lightBackgroundColor,
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 4,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _searchKeyWords,
                              onChanged: (String text) {

                              },
                              style: Theme.of(context).textTheme.bodyLarge,
                              decoration: InputDecoration(
                                hintText: 'search_here'.tr,
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: primaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      filterData();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Column(
                      children: [
                        GridView.builder(
                            itemCount: nameIcons.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.1,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  nextPage(namesIcon[index]);
                                },

                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: namesColors[index],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: nameIcons[index],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      namesIcon[index],
                                      // style: TextStyle(
                                      //   fontSize: 16,
                                      //   fontWeight: FontWeight.w500,
                                      //   color: Colors.black.withOpacity(0.7),
                                      // ),
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    )

                                  ],
                                ),

                              );
                            },
                        ),
                      ],
                    ),
                  )

                ],
            ),
          ),
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Topics'.tr,
          //             style: Theme.of(context).textTheme.headlineSmall,
          //           ),
          //           TextButton(
          //             onPressed: () {
          //               _navigationService.navigateTo(routes.AllTopic, arguments: {});
          //             },
          //             style: Theme.of(context).textButtonTheme.style,
          //             child: Text(
          //               'view_all'.tr,
          //               style: TextStyle(fontSize: 14, color: Colors.grey),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SingleChildScrollView(
          //       padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //         children: List.generate(
          //           filteredCategoriesList.length,
          //               (index) => Padding(
          //             padding: const EdgeInsets.only(right: 15),
          //             child: CategoryBox(
          //               category: filteredCategoriesList[index],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          FavoritesList(),
          RecommendsList(),
          ReleasesList(),
        ],
      ),
    );
  }
}
