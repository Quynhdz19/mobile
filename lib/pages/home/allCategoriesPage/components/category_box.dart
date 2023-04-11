import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({Key? key, required this.category}) : super(key: key);

  final category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
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
              style: Theme.of(context).textTheme.titleLarge,
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
    );
  }
}
