import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/all_categories_page.dart';
import 'package:mobile_front_end/utils/data/category_data.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/components/category_box.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllCategoriesPage()));
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
        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
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
        ),
      ],
    );
  }
}
