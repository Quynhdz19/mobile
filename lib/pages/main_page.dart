import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_front_end/pages/home_page.dart';
import 'package:mobile_front_end/pages/learn_page.dart';
import 'package:mobile_front_end/pages/profile_page.dart';
import 'package:mobile_front_end/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  static final List<Widget> navigationBar = <Widget>[
    HomePage(),
    LearnPage(),
    SettingsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome, An")),
      body: Center(child: navigationBar.elementAt(_selectedIndex),),
    bottomNavigationBar: GNav(
            backgroundColor: Colors.lightBlueAccent,
            color: Colors.white,
            gap: 20,
            // onTabChange: (index) {
            //   print(index);
            // },
            tabs: [
              GButton(icon: Icons.home, text: "Home",),
              GButton(icon: Icons.menu_book_outlined, text: "Learn",),
              GButton(icon: Icons.settings, text: "Settings",),
              GButton(icon: Icons.person, text: "Profile",),
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
