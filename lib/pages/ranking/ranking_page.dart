import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mobile_front_end/pages/ranking/normal_users_item.dart';
import 'package:mobile_front_end/pages/ranking/top_users_item.dart';
import '../../models/user.dart';
import 'dummy_data.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/locator.dart';

class RankingPage extends StatelessWidget {
  RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    readUsers();
    readUsers().listen((users) {
      print(users);
    }, onError: (err) {
      print('Error getting users: $err');
    });
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
                            avatar: Ranking_Profiles[0].avatarUrl,
                            ranking: Ranking_Profiles[0].ranking,
                            name: Ranking_Profiles[0].name,
                            score: Ranking_Profiles[0].score),
                      ),
                      Positioned(
                        top: 90,
                        left: 30,
                        child: TopUserItem(
                            avatar: Ranking_Profiles[1].avatarUrl,
                            ranking: Ranking_Profiles[1].ranking,
                            name: Ranking_Profiles[1].name,
                            score: Ranking_Profiles[1].score),
                      ),
                      Positioned(
                        top: 90,
                        right: 30,
                        child: TopUserItem(
                            avatar: Ranking_Profiles[2].avatarUrl,
                            ranking: Ranking_Profiles[2].ranking,
                            name: Ranking_Profiles[2].name,
                            score: Ranking_Profiles[2].score),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print('okila');
                },
                child: Text('test')),
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
                          child: StreamBuilder(
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
                      )
                          )
                    ],
                  )),
            ),
          ],
        ),
      ),
    ]));
  }

  Widget buildUser(User user) {
    return NormalUserItem(
      avatar: user.imageUrl,
      ranking: 4,
      name: user.fullname,
      score: user.score,
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
