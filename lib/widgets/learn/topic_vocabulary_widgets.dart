
import 'package:flutter/material.dart';
// import 'package:mobile_front_end/utils/constants.dart';

class TopicVocab extends StatelessWidget {
  const TopicVocab({Key? key, required this.category, this.onTap})
      : super(key: key);

  final category;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // child: Container(
      //   width: 150,
      //   height: 100,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     color: Colors.black26,
      //     image: DecorationImage(
      //         image: AssetImage(category["image"]), fit: BoxFit.cover),
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category["name"],
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${category["words"]} topics",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

