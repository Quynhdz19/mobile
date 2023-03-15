import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/all_favorites_page.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/components/favorite_topic_box.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/components/nofavorite_box.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Favorites",
                style: Theme.of(context).textTheme.headline5,
              ),
              favorites.length < 3
                  ? Container(
                height: 16,
              )
                  : TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllFavoritesPage()));
                },
                child: Text(
                  'View all',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                style: Theme.of(context).textButtonTheme.style,
              ),
            ],
          ),
        ),
        favorites.length == 0
            ? NoFavoriteBox()
            : SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    favorites.length,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 15),
                      child: FavoriteTopicBox(
                        topic: favorites[index],
                        onTab: () {
                          print(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
    ;
  }
}
