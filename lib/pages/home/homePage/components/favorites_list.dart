import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/all_favorites_page.dart';
import 'package:mobile_front_end/pages/profile/favoritePage/favorite_page.dart';
import 'package:mobile_front_end/utils/data/recomentopic_data.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/components/favorite_topic_box.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/components/nofavorite_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> with TickerProviderStateMixin {
  List arrayFavoriteTopics = [];

  Future<void> getScoreUser()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: prefs.getString('email')) // add your condition here
        .get();
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};
    setState(() {
      arrayFavoriteTopics = data != null && data is Map<String, dynamic> ? data['favorites'] : []; // do không đổi được tên trên firebase nên để vậy

    });

  }

  List dataTopics = [];


  Future<void> getDataTopics() async {
    var values = arrayFavoriteTopics;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('topics')
          .where('id', whereIn: values)
          .get();

      querySnapshot.docs.forEach((doc) {
        dataTopics.add(doc.data());
      });
    } catch (e) {
    }
  }


  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await getScoreUser();
    await getDataTopics();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'my_favorites'.tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              dataTopics.length < 3
                  ? Container(
                height: 16,
              )
                  : TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritePage()));
                },
                style: Theme.of(context).textButtonTheme.style,
                child: const Text(
                  'View all',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        dataTopics.isEmpty
            ? const NoFavoriteBox()
            : SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              dataTopics.length,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 15),
                child: FavoriteTopicBox(
                  topic: dataTopics[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}