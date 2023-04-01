import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/components/all_favorites_list.dart';
import 'package:mobile_front_end/pages/home/homepage/home_page.dart';

class AllFavoritesPage extends StatefulWidget {
  const AllFavoritesPage ({Key? key}) : super(key: key);

  @override
  State<AllFavoritesPage> createState() => _AllFavoritesPageState();
}

class _AllFavoritesPageState extends State<AllFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          title: const Text(
            'My Favorites',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: AllFavoritesList(),
        ),
      ),
    );
  }
}
