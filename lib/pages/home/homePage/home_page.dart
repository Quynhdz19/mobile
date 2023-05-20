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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             SizedBox(height: 5),
      //             Text(
      //               'welcome_back'.tr,
      //               style: TextStyle(
      //                 color: Colors.grey.shade300,
      //                 fontSize: 14,
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 5,
      //             ),
      //             Text(
      //               fullname,
      //               style: TextStyle(
      //                 color: Colors.grey.shade200,
      //                 fontSize: 20,
      //                 fontFamily: GoogleFonts.poppins().toString(),
      //               ),
      //             ),
      //             SizedBox(height: 5),
      //           ],
      //         ),
      //        NotificationBox(
      //         notifiedNumber: 1,
      //       )
      //     ],
      //   ),
      // ),
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('home'.tr, style: TextStyle(fontSize: 18)),
      ),
      body: buildHomePageBody(context),
    );
  }

  Widget buildHomePageBody(BuildContext context) {
    return SingleChildScrollView(
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
                      color: lightBackgroundColor,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'categories'.tr,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        _navigationService.navigateTo(routes.AllTopic, arguments: {});
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'view_all'.tr,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filteredCategoriesList.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CategoryBox(
                        category: filteredCategoriesList[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          FavoritesList(),
          RecommendsList(),
          ReleasesList(),
        ],
      ),
    );
  }
}
