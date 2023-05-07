import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/game/choiceWorkGame/choice_work_controller.dart';
import 'package:mobile_front_end/models/games/work_topic.dart';
import 'package:mobile_front_end/pages/games/choiceWorkGame/components/choice_work_menu_item.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ChoiceWorkPage extends StatefulWidget {
  ChoiceWorkPage({Key? key}) : super(key: key);

  @override
  State<ChoiceWorkPage> createState() => _ChoiceWorkPageState();
}

class _ChoiceWorkPageState extends State<ChoiceWorkPage> {
  List<Map<dynamic, dynamic>> topicList = [];
  void getWorkTopics() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot =
        await firestore.collection('choice-work').get();
    final List<QueryDocumentSnapshot> topics = snapshot.docs;

    topics.forEach((category) {
      Map<dynamic, dynamic> data = category.data() as Map<dynamic, dynamic>;
      topicList.add(data);
    });
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getWorkTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choice Work Game',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: choiceWorkColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: choiceWorkBackgroundColor,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'topic'.tr,
              style: TextStyle(
                  fontSize: 30,
                  color: choiceWorkColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  topicList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: ChoiceWorkMenuItem(
                        topic: WorkTopic(
                            id: topicList[index]["id"],
                            imgUrl: topicList[index]["image"],
                            desc: topicList[index]["desc"],
                            name: topicList[index]["name"])),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
