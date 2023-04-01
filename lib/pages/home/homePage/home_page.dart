import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/homepage/components/categories_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/favorites_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/recommends_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/releases_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/search_bar.dart';
import 'package:mobile_front_end/pages/home/homePage/components/notification_box.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullname = "";

  @override
  void initState() {
    super.initState();
    getFullname();
  }

  void getFullname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      fullname = (snap.data() as Map<String, dynamic>)["fullname"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullname,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const NotificationBox(
                notifiedNumber: 1,
              )
            ],
          ),
        ),
      body: buildHomePageBody(context),
    );
  }


  Widget buildHomePageBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: const [
        SearchBar(),
        CategoriesList(),
        FavoritesList(),
        RecommendsList(),
        ReleasesList(),
      ],
    ));
  }

}
