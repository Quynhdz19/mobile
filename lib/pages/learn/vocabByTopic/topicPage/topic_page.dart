import 'package:flutter/material.dart';
import 'package:mobile_front_end/widgets/topic_box.dart';

import '../../../../utils/data/topic_data.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:() {
            //_navigationService.goBack();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          'Basic',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(
              topics.length,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TopicBox(
                  widthBox: double.infinity,
                  topic: topics[index],
                  onTab: () {
                    print(index);
                  },
                ),
              ),
            ),
          ),
        ),
    );
  }
}
