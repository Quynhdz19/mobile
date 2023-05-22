import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mobile_front_end/pages/ranking/normal_users_item.dart';
import 'package:mobile_front_end/pages/ranking/top_users_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user.dart';
import '../../utils/constants.dart';
import '../common_component/LeftSideBar.dart';
import 'dummy_data.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class RankingPage extends StatefulWidget {
  RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  List<Map<dynamic, dynamic>> all_users_list = [];
  String fullname = "";
  void get_all_users() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore
        .collection('users')
        .orderBy('score', descending: true)
        .get();
    final List<QueryDocumentSnapshot> all_users = snapshot.docs;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot user = await FirebaseFirestore.instance
        .collection('users')
        .where('email',
            isEqualTo: prefs.getString('email')) // add your condition here
        .get();

    // get data from the first document in the snapshot
    final Object? data = snapshot.docs.isNotEmpty ? user.docs.first.data() : {};

    fullname =
        data != null && data is Map<String, dynamic> ? data['fullname'] : '';

    all_users.forEach((user) {
      Map<dynamic, dynamic> data = user.data() as Map<dynamic, dynamic>;
      all_users_list.add(data);
    });
    setState(() {});
  }

  getRank(
    int rank,
    var list,
    String? uid,
  ) {
    for (int i = 0; i < list.length; i++) {
      if (uid == list[i]["uid"]) {
        rank = i + 1;
      }
    }
    return rank;
  }

  @override
  void initState() {
    super.initState();
    get_all_users();
  }

  @override
  Widget build(BuildContext context) {
    if (all_users_list.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    final NavigationService _navigationService = locator<NavigationService>();
    return Scaffold(
        drawer: LeftSideBar(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('ranking'.tr, style: TextStyle(fontSize: 18)),
        ),
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(

          image: DecorationImage(
            image: AssetImage('assets/images/ranking_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),

      ),
      Container(
        child: Column(
          children: [
            Container(
              //padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              height: MediaQuery.of(context).size.height / 2.5,
              child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/ranking_order.png'),
                ),
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width / 3.1,
                  child: TopUserItem(
                    avatar: all_users_list[0]["imageUrl"],
                    ranking: 1,
                    name: all_users_list[0]["fullname"],
                    score: all_users_list[0]["score"],
                    fullname: fullname,
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  child: TopUserItem(
                    avatar: all_users_list[1]["imageUrl"],
                    ranking: 2,
                    name: all_users_list[1]["fullname"],
                    score: all_users_list[1]["score"],
                    fullname: fullname,
                  ),
                ),
                Positioned(
                  top: 110,
                  right: 30,
                  child: TopUserItem(
                    avatar: all_users_list[2]["imageUrl"],
                    ranking: 3,
                    name: all_users_list[2]["fullname"],
                    score: all_users_list[2]["score"],
                    fullname: fullname,
                  ),
                ),
              ],
              )
            ),
            Expanded(
              child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text(
                            'ranking'.tr,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: Text(
                            'score'.tr,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              int rank = 0;
                              return NormalUserItem(
                                  avatar: all_users_list[index + 3]["imageUrl"],
                                  ranking: getRank(rank, all_users_list,
                                      all_users_list[index + 3]["uid"]),
                                  name: all_users_list[index + 3]["fullname"],
                                  score: all_users_list[index + 3]["score"],
                                  fullname: fullname);
                            },
                            itemExtent: 70,
                            padding: EdgeInsets.zero,
                            itemCount: all_users_list.length - 3,
                          ),
                        )
                      ],
                    )
                  ),

            ),
          ],
        ),
      ),
    ])
    );
  }

  Widget buildUser(User user) {
    return NormalUserItem(
        avatar: user.imageUrl,
        ranking: 4,
        name: user.fullname,
        score: user.score,
        fullname: fullname);
  }
}
