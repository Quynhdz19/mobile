import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mobile_front_end/pages/ranking/normal_users_item.dart';
import 'package:mobile_front_end/pages/ranking/top_users_item.dart';
import '../../models/user.dart';
import 'dummy_data.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/locator.dart';

class RankingPage extends StatefulWidget {
  RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  List<Map<dynamic, dynamic>> all_users_list = [];
  void get_all_users() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('users').orderBy('score', descending: true).get();
    final List<QueryDocumentSnapshot> all_users = snapshot.docs;

    all_users.forEach((user) {
      Map<dynamic, dynamic> data = user.data() as Map<dynamic, dynamic>;
      all_users_list.add(data);
    });
    setState(() {

    });
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
    final NavigationService _navigationService = locator<NavigationService>();
    print(all_users_list);
    return Scaffold(
        body: Stack(children: [
      SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ranking_bg.jpg'),
              fit: BoxFit.cover, // or BoxFit.contain
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  _navigationService.goBack();
                },
              ),
            ),
          ),
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              height: MediaQuery.of(context).size.height / 2.5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: MediaQuery.of(context).size.width / 2.5,
                        child: TopUserItem(
                            avatar: all_users_list[0]["imageUrl"],
                            ranking: 1,
                            name: all_users_list[0]["fullname"],
                            score: all_users_list[0]["score"]),
                      ),
                      Positioned(
                        top: 90,
                        left: 30,
                        child: TopUserItem(
                            avatar: all_users_list[1]["imageUrl"],
                            ranking: 2,
                            name: all_users_list[1]["fullname"],
                            score: all_users_list[1]["score"]),
                      ),
                      Positioned(
                        top: 90,
                        right: 30,
                        child: TopUserItem(
                            avatar: all_users_list[2]["imageUrl"],
                            ranking: 3,
                            name: all_users_list[2]["fullname"],
                            score: all_users_list[2]["score"]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
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
                          child: /*StreamBuilder(
                          stream: readUsers(),
                          builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final users = snapshot.data!;
                            return ListView(
                              children:
                                  (users as List<User>).map(buildUser).toList(),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Something went wrong');
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )*/
                           ListView.builder(
                             itemBuilder: (context, index) {
                               int rank = 0;
                              return NormalUserItem(
                                  avatar: all_users_list[index+3]["imageUrl"],
                                  ranking: getRank(rank, all_users_list, all_users_list[index+3]["uid"]),
                                  name: all_users_list[index+3]["fullname"],
                                  score: all_users_list[index+3]["score"]);
                             },
                             itemExtent: 70,
                             padding: EdgeInsets.zero,
                             itemCount: all_users_list.length - 3,
                           ),
                          )
                    ],
                  )),
            ),
          ],
        ),
      ),
    ]));
  }

}

