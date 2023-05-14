import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_front_end/pages/home/homePage/home_page.dart';
import 'package:mobile_front_end/pages/learn/learn_page.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/pages/games/gamesPage/games_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.selected}) : super(key: key);

  final int selected;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  static final List<Widget> navigationBar = <Widget>[
    HomePage(),
    LearnPage(),
    GamesPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.selected;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: navigationBar.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: primaryColor,
        color: Colors.white,
        gap: 8,
        // onTabChange: (index) {
        //   print(index);
        // },
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'home'.tr,
          ),
          GButton(
            icon: Icons.menu_book_outlined,
            text: 'learn'.tr,
          ),
          GButton(
            icon: Icons.games,
            text: 'game'.tr,
          ),
          GButton(
            icon: Icons.person,
            text: 'profile'.tr,
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
