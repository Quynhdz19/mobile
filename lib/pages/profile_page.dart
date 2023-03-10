import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/edit_profile_page.dart';
import 'package:mobile_front_end/utils/themes/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: Container(
                    //     width: 30,
                    //     height: 30,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(100),
                    //       color: Colors.blueAccent.withOpacity(0.1),
                    //     ),
                    //     child: const Icon(
                    //       Icons.edit,
                    //       size: 25,
                    //       color: Colors.blueAccent,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "An",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "an@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: Theme.of(context).elevatedButtonTheme.style

                  // ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.blue,
                  //     side: BorderSide.none,
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //     shape: const StadiumBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                //  Menu
                ProfileMenuItem(
                  title: "Learning Process",
                  icon: Icons.list_alt,
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

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDarkMode ? Colors.blueAccent : Colors.white;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        // padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueAccent.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blueAccent.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.chevron_right,
                size: 25,
                color: Colors.blueAccent,
              ),
            )
          : null,
    );
  }
}
