import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/components/category_box.dart';
import 'package:mobile_front_end/utils/data/category_data.dart';

class AllCategoriesList extends StatelessWidget {
  const AllCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.4,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List.generate(
        categories.length,
            (index) => Padding(
          padding: const EdgeInsets.all(8),
          child: CategoryBox(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
