import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/edit_profile_page.dart';
import 'package:mobile_front_end/utils/data/catedory_data.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';
import 'package:mobile_front_end/widgets/category_box.dart';
import 'package:mobile_front_end/widgets/nofavorite_box.dart';
import 'package:mobile_front_end/widgets/notification_box.dart';
import 'package:mobile_front_end/utils/color.dart';
import 'package:mobile_front_end/widgets/topic_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: buildHomePageBody(context),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "An",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            NotificationBox(
              notifiedNumber: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget buildHomePageBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()));
                },
                child: Text(
                  'View All',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                style: Theme.of(context).textButtonTheme.style,
              ),
            ],
          ),
        ),
        getCategories(),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Favorites",
                style: TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              favorites.length < 3 ? Container(height: 16,) : TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()));
                },
                child: Text(
                  'View All',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                style: Theme.of(context).textButtonTheme.style,
              ),
            ],
          ),
        ),
        getFavorites(),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        getRecommends(),
      ],
    ));
  }

  Widget getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              category: categories[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget getRecommends() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              topics.length,
              (index) => Container(
                    margin: EdgeInsets.only(right: 15),
                    child: TopicBox(
                      topic: topics[index],
                      onTab: () {
                        print(index);
                      },
                    ),
                  ))),
    );
  }

  Widget getFavorites() {
    return favorites.length == 0
        ? NoFavoriteBox()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    topics.length,
                    (index) => Container(
                          margin: EdgeInsets.only(right: 15),
                          child: TopicBox(
                            topic: topics[index],
                            onTab: () {
                              print(index);
                            },
                          ),
                        ))),
          );
  }
}
