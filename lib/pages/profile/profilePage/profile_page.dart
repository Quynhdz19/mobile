import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/learn/dictionaryPage/dictionary_page.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';

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
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          title: Text(
            'Profile',
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
                        child: Image(
                          image: AssetImage("images/avatar.jpeg"),
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
                  style: Theme.of(context).textTheme.headline1,
                  // TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(email,
                    style: Theme.of(context).textTheme.subtitle1
                    // TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    },
                    child: const Text(
                      "Edit profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    style: Theme.of(context).elevatedButtonTheme.style),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "/images/level.jpeg",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Your Level",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
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
                              "/images/rank.jpeg",
                              height: 60,
                              width: 60,
                            ),
                          ),
                          Text(
                            "100 Points",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "No Rank",
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
                  title: "Learning Process",
                  icon: Icons.list_alt,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: "Dictionary",
                  icon: Icons.book,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DictionaryPage()));
                  },
                ),
                ProfileMenuItem(
                  title: "Favorite Lessons",
                  icon: Icons.favorite,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: "Feedback",
                  icon: Icons.feedback,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: "Phone number",
                  icon: Icons.call,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: "Notifications",
                  icon: Icons.notifications,
                  onPress: () {},
                ),
                ProfileMenuItem(
                  title: "Seting ",
                  icon: Icons.settings,
                  onPress: () {},
                ),
                const Divider(),
                ProfileMenuItem(
                  title: "Logout",
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
