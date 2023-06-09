import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/components/all_categories_list.dart';
import 'package:mobile_front_end/pages/home/homepage/home_page.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/router.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../services/locator.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  State<TopicsPage> createState() => _TopicsPage();
}

class _TopicsPage extends State<TopicsPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _navigationService.goBack();
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          title: const Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: AllCategoriesList(),
            ),
        ),
      ),
    );
  }
}
