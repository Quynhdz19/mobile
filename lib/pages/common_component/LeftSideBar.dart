import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/locator.dart';
import '../../services/navigation_service.dart';
import '../../services/route_paths.dart' as routes;
import '../../utils/constants.dart';
import '../profile/settingsPage/settings_page.dart';

class LeftSideBar extends StatelessWidget {
  LeftSideBar({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("A"),
            accountEmail: Text("a@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    "https://toigingiuvedep.vn/wp-content/uploads/2022/01/hinh-avatar-cute-nu.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://thuthuatnhanh.com/wp-content/uploads/2021/12/background-vu-tru-4K.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            decoration: BoxDecoration(
              color: lightPrimaryColor,
            ),
            child: Column(
              children: [
                ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home page"),
                    onTap: () => {
                          _navigationService
                              .navigateTo(routes.MainPage, arguments: {})
                        }),
                ListTile(
                    leading: Icon(Icons.menu_book_outlined),
                    title: Text("Lessons"),
                    onTap: () => {
                          _navigationService
                              .navigateTo(routes.LearningPage, arguments: {})
                        }),
                ListTile(
                  leading: Icon(Icons.gamepad),
                  title: Text("Game"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.GamesPage, arguments: {})
                  },
                ),
                ExpansionTile(
                  title: Text("Exam preparation"),
                  leading: Icon(Icons.text_snippet),
                  childrenPadding: EdgeInsets.only(left: 30),
                  children: [
                    ListTile(
                        leading: Icon(Icons.text_increase),
                        title: Text("Toiec"),
                        onTap: () => {
                          _navigationService
                              .navigateTo(routes.ToiecPage, arguments: {})
                        }),
                    ListTile(
                        leading: Icon(Icons.insert_chart),
                        title: Text("Ielts"),
                        onTap: () => {
                          _navigationService
                              .navigateTo(routes.IeltsPage, arguments: {})
                        }),
                  ],
                ),
                Divider(),
                ListTile(
                    leading: Icon(Icons.book),
                    title: Text("Dictionary"),
                    onTap: () => {
                          _navigationService
                              .navigateTo(routes.LearnDictionary, arguments: {})
                        }),
                ListTile(
                  leading: Icon(Icons.area_chart),
                  title: Text("Learning process"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.LearnProgressPage, arguments: {})
                  },
                ),
                ListTile(
                  leading: Icon(Icons.poll),
                  title: Text("Ranking"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.RankingPage, arguments: {})
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favorite"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.FavoritePage, arguments: {})
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text("Calendar"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.CalendarPage, arguments: {})
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications"),
                  onTap: () => {
                    _navigationService
                        .navigateTo(routes.CalendarPage, arguments: {})
                  },
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()))
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Exit"),
                  onTap: () => print("home"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
