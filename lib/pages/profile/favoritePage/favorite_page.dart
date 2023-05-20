import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/profile/favoritePage/components/favorite_video_box.dart';
import 'package:mobile_front_end/pages/profile/favoritePage/components/favorite_word_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_component/LeftSideBar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with TickerProviderStateMixin {

  List arrayFavoriteVideos = [];
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
      arrayFavoriteVideos = data != null && data is Map<String, dynamic> ? data['favorites_topic'] : [];

    });

  }
  List dataTopics = [];
  List dataVideo = [];
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
  Future<void> getDataVideo() async {
    var values = arrayFavoriteVideos;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('video')
          .where('url', whereIn: values)
          .get();

      querySnapshot.docs.forEach((doc) {
        dataVideo.add(doc.data());
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
    await getDataVideo();
    await getDataTopics();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('my_favorites'.tr,style: TextStyle(fontSize: 18)),
      ),
      body: Stack(children: [
           Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/myfavorite.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Spacer(
                flex: 3,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          controller: _tabController,
                          // isScrollable: true,
                          labelColor: favoriteColor,
                          unselectedLabelColor:
                              Color.fromRGBO(113, 188, 191, 1),
                          indicatorColor: favoriteColor,
                          tabs: [
                            Tab(text: "Videos"),
                            Tab(text: "Topics"),
                          ],
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 350,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            PageView.builder(
                              itemCount: dataVideo.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return FavoriteVideoBox(video: dataVideo[index]);
                              },
                            ),
                            Container(
                              height: 400,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: List.generate(
                                      dataTopics.length, (index) => Container(
                                      child: FavoriteWordBox(
                                         dataTopic: dataTopics[index]
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ]),
    );
  }
}
