import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allFavoritesPage/components/favorite_topic_box.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';

class AllFavoritesList extends StatelessWidget {
  const AllFavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.3,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 1,
      shrinkWrap: true,
      children: List.generate(
        favorites.length,
            (index) => Padding(
          padding: const EdgeInsets.all(8),
          child: FavoriteTopicBox(
            topic: favorites[index],
          ),
        ),
      ),
    );
  }
}
