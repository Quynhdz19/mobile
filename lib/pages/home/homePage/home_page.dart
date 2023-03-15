import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/homepage/components/categories_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/favorites_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/recommends_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/releases_list.dart';
import 'package:mobile_front_end/pages/home/homepage/components/search_bar.dart';
import 'package:mobile_front_end/pages/home/homePage/components/notification_box.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "An",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome back!",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              NotificationBox(
                notifiedNumber: 1,
              )
            ],
          ),
        ),
      body: buildHomePageBody(context),
    );
  }


  Widget buildHomePageBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SearchBar(),
        CategoriesList(),
        FavoritesList(),
        RecommendsList(),
        ReleasesList(),
      ],
    ));
  }

}
