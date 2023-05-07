import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/allCategoriesPage/components/category_box.dart';




class AllCategoriesList extends StatefulWidget {
    const AllCategoriesList({Key? key}) : super(key: key);
   @override
   _AllCategoriesList createState() => _AllCategoriesList();
}

class _AllCategoriesList extends State<AllCategoriesList> {
  List <Map <dynamic, dynamic>> categoriesList = [];
  void getTopics() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('topics').get();
    final List<QueryDocumentSnapshot> categories = snapshot.docs;

    categories.forEach((category) {
      Map<dynamic, dynamic> data = category.data() as Map<dynamic, dynamic>;
      categoriesList.add(data);
    });
    setState(() {});

  }

  @override
  initState() {
    super.initState();
    getTopics();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        childAspectRatio: 1.4,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(
           categoriesList.length,
              (index) => Padding(
            padding: const EdgeInsets.all(8),
            child: CategoryBox(
              category: categoriesList[index],
            ),
          ),
        ),
      ),
    );
  }
}

