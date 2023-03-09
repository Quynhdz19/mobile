import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_front_end/pages/learn_page.dart';
import 'package:mobile_front_end/pages/profile_page.dart';

// class Homepage extends StatelessWidget {
//   int _selectedIndex = 0;
//
//   static final List<Widget> navigationBar = <Widget>[
//     Homepage(),
//     LearnPage(),
//     ProfilePage()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           bottomNavigationBar: GNav(
//             backgroundColor: Colors.lightBlueAccent,
//             color: Colors.white,
//             gap: 8,
//             // onTabChange: (index) {
//             //   print(index);
//             // },
//             tabs: [
//               GButton(icon: Icons.home, text: "Home",),
//               GButton(icon: Icons.menu_book_outlined, text: "Learn",),
//               GButton(icon: Icons.settings, text: "Settings",),
//               GButton(icon: Icons.person, text: "Profile",),
//             ],
//             selectedIndex: _selectedIndex,
//             onTabChange: (index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//           ),
//           body: Center(
//             child: Text("Home page"),
//           ),
//       );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}
