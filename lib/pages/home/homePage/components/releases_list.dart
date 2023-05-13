import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/data/releasetopic_data.dart';
import 'package:mobile_front_end/widgets/topic_box.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import '../../../learn/vocabByTopic/newRelease/component/release.dart';
import '../../../learn/vocabByTopic/newRelease/new_release_word.dart';

class ReleasesList extends StatefulWidget {
  const ReleasesList({Key? key}) : super(key: key);

  @override
  State<ReleasesList> createState() => _ReleasesList();
}
class _ReleasesList extends State<ReleasesList> {

  List newReleaseLists = [];
  void newReleaseList() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('new-release').get();
    final List<QueryDocumentSnapshot> categories = snapshot.docs;

    categories.forEach((category) {
      Object? data = category.data();
      newReleaseLists.add(data);
    });
  }

  final NavigationService _navigationService = locator<NavigationService>();


  @override
  initState() {
    super.initState();
    newReleaseList();
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
                'new_releases'.tr,
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
              newReleaseLists.length,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 15),
                child: ReleaseBox(
                  widthBox: 300,
                  topic: newReleaseLists[index],
                  category: newReleaseLists,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
