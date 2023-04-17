import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/all_categories_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/data/category_data.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/components/category_box.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'categories'.tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  _navigationService.navigateTo(routes.LearnCategories);
                },
                style: Theme.of(context).textButtonTheme.style,
                child: Text(
                  'view_all'.tr,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
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
