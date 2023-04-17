import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/constants.dart';
import '../components/profile_menu_item.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  static const keyLanguage = 'key-language';
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
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
                const SizedBox(
                  height: 30,
                ),
                //  Menu
                ProfileMenuItem(
                  title: "Language",
                  icon: Icons.language,
                  onPress: () {},
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
                  title: "Settings",
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
