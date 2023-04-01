import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_front_end/pages/home/homePage/home_page.dart';
import 'package:mobile_front_end/pages/learn/learnPage/learn_page.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/pages/games/gamesPage/games_page.dart';
import 'package:mobile_front_end/utils/constants.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> navigationBar = <Widget>[
    const HomePage(),
    const LearnPage(),
    const GamesPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: navigationBar.elementAt(_selectedIndex),),
      bottomNavigationBar: GNav(
        backgroundColor: primaryColor,
        color: Colors.white,
        gap: 8,
        // onTabChange: (index) {
        //   print(index);
        // },
        tabs: const [

          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.menu_book_outlined,
            text: "Learn",
          ),
          GButton(
            icon: Icons.games,
            text: "Game",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
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

