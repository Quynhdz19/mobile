import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/learn/dictionaryPage/dictionary_page.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/pages/profile/settingsPage/settings_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

import 'package:mobile_front_end/utils/themes/theme.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

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
    getEmail();
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

  void getEmail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      email = (snap.data() as Map<String, dynamic>)["email"];
    });
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
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
                  style: Theme.of(context).textTheme.displayLarge,
                  // TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(email, style: Theme.of(context).textTheme.titleMedium
                    // TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                      _navigationService.navigateTo(routes.EditProfilePage);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'edit_profile'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
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
                        width: 30,
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
                            'no_rank'.tr,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: 'dictionary'.tr,
                  icon: Icons.book,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DictionaryPage()));
                  },
                ),
                ProfileMenuItem(
                  title: 'favorite_lesson'.tr,

                  icon: Icons.favorite,
                  onPress: () {
                    _navigationService.navigateTo(routes.FavoritePage);
                  },
                ),
                ProfileMenuItem(
                  title: 'feedback'.tr,
                  icon: Icons.feedback,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: 'phone_number'.tr,
                  icon: Icons.call,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: 'notifications'.tr,
                  icon: Icons.notifications,
                  onPress: () {},
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
                  onPress: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
