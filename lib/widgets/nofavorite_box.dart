import 'package:flutter/material.dart';

import '../utils/color.dart';

class NoFavoriteBox extends StatelessWidget {
  const NoFavoriteBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("images/category.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You haven't added any favorites yet",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: lightTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Tap the heart icon on your favorite topics",
              softWrap: false,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: lightTextColor,
              ),
            )
          ],
        )
      ],
    );
  }
}
