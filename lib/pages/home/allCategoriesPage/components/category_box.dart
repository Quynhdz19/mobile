import 'package:flutter/material.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class CategoryBox extends StatelessWidget {
  CategoryBox({Key? key, required this.category, this.onPressed}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  final category;
  final GestureTapCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigationService.navigateTo(routes.LearnNewWord);
      },
      child: Container(width: 150,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black26,
          image: DecorationImage(
              image: AssetImage(
                  category["image"]
              ),
              fit: BoxFit.cover
          ),
        ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category["name"],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${category["topics"]} topics",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),

    )
    );
  }
}
