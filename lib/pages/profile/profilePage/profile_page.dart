import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/auth/login.dart';
import 'package:mobile_front_end/pages/learn/dictionaryPage/dictionary_page.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/pages/profile/settingsPage/settings_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

import 'package:mobile_front_end/utils/themes/theme.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

import '../components/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullname = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getFullname();
  }

  void getFullname() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: prefs.getString('email')) // add your condition here
        .get();

    // get data from the first document in the snapshot
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};


    setState(() {
      fullname = data != null && data is Map<String, dynamic> ? data['fullname'] : 'Chào bạn!';
      email = prefs.getString('email')!;
    });
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'profile'.tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                    isDarkMode ? Icons.sunny : Icons.nightlight_round_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage("assets/images/avatar.jpeg"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  fullname,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: GoogleFonts.poppins().toString(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(email,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfilePage()));
                      _navigationService
                          .navigateTo(routes.EditProfilePage, arguments: {});
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'edit_profile'.tr,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().toString(),
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/level.jpeg",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'your_level'.tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const Text(
                            "100",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: greenColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/rank.jpeg",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          Text(
                            "100 ${'points'.tr}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'rank'.tr,

                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.poppins().toString(),
                                color: redColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //  Menu
                ProfileMenuItem(
                  title: 'learning_process'.tr,
                  icon: Icons.list_alt,
                  onPress: () {
                    _navigationService
                        .navigateTo(routes.LearnProgressPage, arguments: {});
                  },
                ),

                ProfileMenuItem(
                  title: 'favorite_lesson'.tr,
                  icon: Icons.favorite,
                  onPress: () {
                    _navigationService
                        .navigateTo(routes.FavoritePage, arguments: {});
                  },
                ),
                ProfileMenuItem(
                  title: 'ranking'.tr,
                  icon: Icons.assessment,
                  onPress: () {
                    _navigationService
                        .navigateTo(routes.RankingPage, arguments: {});
                  },
                ),
                ProfileMenuItem(
                  title: 'calendar'.tr,
                  icon: Icons.access_time,
                  onPress: () {
                    _navigationService
                        .navigateTo(routes.CalendarPage, arguments: {});
                  },
                ),
                ProfileMenuItem(
                  title: 'settings'.tr,
                  icon: Icons.settings,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                ),
                const Divider(),
                ProfileMenuItem(
                  title: 'logout'.tr,
                  icon: Icons.output,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
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
                                        fontFamily: GoogleFonts.poppins().toString(),
                                      )),
                                )
                              ],
                            ),
                            content: Text('logout_content'.tr, style: const TextStyle(
                              fontSize: 18,
                            )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('cancel'.tr,
                                      style: const TextStyle(color: greyColor))),
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
                                      style:
                                          const TextStyle(color: redColor)))
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
