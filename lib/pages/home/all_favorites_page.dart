import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/home_page.dart';
import 'package:mobile_front_end/utils/data/category_data.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';
import 'package:mobile_front_end/widgets/category_box.dart';
import 'package:mobile_front_end/widgets/favorite_topic_box.dart';

class AllFavoritesPage extends StatefulWidget {
  const AllFavoritesPage ({Key? key}) : super(key: key);

  @override
  State<AllFavoritesPage> createState() => _AllFavotitesPageState();
}

class _AllFavotitesPageState extends State<AllFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          title: Text(
            'My Favorites',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: GridView.count(
            childAspectRatio: 1.3,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            shrinkWrap: true,
            children: List.generate(
              categories.length,
                  (index) => Padding(
                padding: const EdgeInsets.all(8),
                child: FaVoriteTopicBox(
                  topic: favorites[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
