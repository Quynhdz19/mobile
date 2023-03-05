import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Hompage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: GNav(
            backgroundColor: Colors.lightBlueAccent,
            color: Colors.white,
            gap: 8,
            onTabChange: (index) {
              print(index);
            },
            tabs: const [
              GButton(icon: Icons.home, text: "Home",),
              GButton(icon: Icons.favorite, text: "Bài học",),
              GButton(icon: Icons.search, text: "Tìm kiếm",),
              GButton(icon: Icons.settings, text: "Cài đặt",),
            ],
          ),
      );
  }
}
