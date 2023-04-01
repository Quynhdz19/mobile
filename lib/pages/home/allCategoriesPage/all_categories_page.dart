import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/components/all_categories_list.dart';
import 'package:mobile_front_end/pages/home/homepage/home_page.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({Key? key}) : super(key: key);

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
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
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: AllCategoriesList(),
        ),
      ),
    );
  }
}
