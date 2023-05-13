import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/widgets/topic_box.dart';
import 'package:mobile_front_end/utils/data/recomentopic_data.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import '../../../learn/vocabByTopic/recommend/components/recommend.dart';

class RecommendsList extends StatefulWidget {
  const RecommendsList({Key? key}) : super(key: key);

  @override
  State<RecommendsList> createState() => _RecommendsList();
}
class _RecommendsList extends State<RecommendsList> {

  List recommenTopic = [];
  void recommenTopics() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('recommend').get();
    final List<QueryDocumentSnapshot> categories = snapshot.docs;

    categories.forEach((category) {
      Object? data = category.data();
      recommenTopic.add(data);
    });
  }

  final NavigationService _navigationService = locator<NavigationService>();


  @override
  initState() {
    super.initState();
    recommenTopics();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'recommend_for_you'.tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              recommenTopic.length,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 15),
                child: Recommend(
                  widthBox: 300,
                  topic: recommenTopic[index],
                  category: recommenTopic,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
