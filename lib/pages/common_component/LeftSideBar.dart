import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/locator.dart';
import '../../services/navigation_service.dart';
import '../../services/route_paths.dart' as routes;
import '../../utils/constants.dart';
import '../profile/settingsPage/settings_page.dart';

class LeftSideBar extends StatefulWidget {
  LeftSideBar({Key? key}) : super(key: key);

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  String fullname = "";
  String email = "";
  String imgUrl =
      "https://w7.pngwing.com/pngs/867/694/png-transparent-user-profile-default-computer-icons-network-video-recorder-avatar-cartoon-maker-blue-text-logo.png";
  int level = 0;
  int score = 0;

  final NavigationService _navigationService = locator<NavigationService>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getFullname();
  }

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
      email = prefs.getString('email')!;
      imgUrl = data != null && data is Map<String, dynamic>
          ? data['imageUrl']
          : 'https://w7.pngwing.com/pngs/867/694/png-transparent-user-profile-default-computer-icons-network-video-recorder-avatar-cartoon-maker-blue-text-logo.png';
      level = data != null && data is Map<String, dynamic> ? data['level'] : 0;
      score = data != null && data is Map<String, dynamic> ? data['score'] : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              fullname,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: lightBackgroundColor),
            ),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(imgUrl,
                    width: 100, height: 100, fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://thuthuatnhanh.com/wp-content/uploads/2021/12/background-vu-tru-4K.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? darkBackgroundColor : lightPrimaryColor,
            ),
            child: Column(
              children: [
                ListTile(
                    leading: Icon(Icons.home),

                    title: Text("Home",
                    style: Theme.of(context).textTheme.bodyMedium,),

                    onTap: () => {
                          _navigationService
                              .navigateTo(routes.MainPage, arguments: {})
                        }),
                ListTile(
                    leading: Icon(Icons.menu_book_outlined),
                    title: Text("Lessons",
                      style: Theme.of(context).textTheme.bodyMedium,),
                    onTap: () => {
                          _navigationService
                              .navigateTo(routes.LearningPage, arguments: {})
                        }),
                ListTile(
                  leading: Icon(Icons.gamepad),
                  title: Text("Game",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.GamesPage, arguments: {})
                  },
                ),
                ExpansionTile(
                  title: Text("Exam preparation"),
                  leading: Icon(Icons.text_snippet),
                  childrenPadding: EdgeInsets.only(left: 30),
                  children: [
                    ListTile(

                        leading: Icon(
                          Icons.text_increase,
                          color: primaryColor,
                        ),
                        title: Text("Toiec", style: Theme.of(context).textTheme.bodyMedium,),

                        onTap: () => {
                              _navigationService
                                  .navigateTo(routes.ToiecPage, arguments: {})
                            }),
                    ListTile(

                        leading: Icon(Icons.insert_chart),
                        title: Text("Ielts", style: Theme.of(context).textTheme.bodyMedium,),

                        onTap: () => {
                          _navigationService
                              .navigateTo(routes.IeltsPage, arguments: {})
                        }),
                  ],
                ),
                Divider(),
                ListTile(
                    leading: Icon(Icons.book),
                    title: Text("Dictionary",
                      style: Theme.of(context).textTheme.bodyMedium,),
                    onTap: () => {
                          _navigationService
                              .navigateTo(routes.LearnDictionary, arguments: {})
                        }),
                ListTile(
                  leading: Icon(Icons.area_chart),
                  title: Text("Learning process",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.LearnProgressPage, arguments: {})
                  },
                ),
                ListTile(
                  leading: Icon(Icons.poll),
                  title: Text("Ranking",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.RankingPage, arguments: {})
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favorite",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.FavoritePage, arguments: {})
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month),

                  title: Text("Daily Calendar",
                    style: Theme.of(context).textTheme.bodyMedium,),

                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.CalendarPage, arguments: {})
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.CalendarPage, arguments: {})
                  },
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings",
                    style: Theme.of(context).textTheme.bodyMedium,),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()))
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.EditProfilePage, arguments: {})
                  },
                ),
                Divider(),
                ListTile(

                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Text('logout'.tr,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor,
                                        fontFamily:
                                            GoogleFonts.poppins().toString(),
                                      )),
                                )
                              ],
                            ),
                            content: Text('logout_content'.tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('cancel'.tr,
                                      style:
                                          const TextStyle(color: greyColor))),
                              TextButton(
                                  onPressed: () {
                                    _auth.signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: Text('logout'.tr,
                                      style: const TextStyle(color: redColor)))
                            ],
                          );
                        })
                  },

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
