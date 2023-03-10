import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/home_page.dart';
import 'package:mobile_front_end/utils/data/category_data.dart';
import 'package:mobile_front_end/widgets/category_box.dart';

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
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          title: Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.count(
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
          ),
        ),
      ),
    );
  }
}
