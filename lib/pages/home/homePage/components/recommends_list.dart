import 'package:flutter/material.dart';
import 'package:mobile_front_end/widgets/topic_box.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';

class RecommendsList extends StatelessWidget {
  const RecommendsList({Key? key}) : super(key: key);

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
                "Recommended for you",
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
              topics.length,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 15),
                child: TopicBox(
                  widthBox: 300,
                  topic: topics[index],
                  onTab: () {
                    print(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
