import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/vocabByTopic/newWordPage/new_word_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class FavoriteTopicBox extends StatelessWidget {
  const FavoriteTopicBox({Key? key, required this.topic}) : super(key: key);
  /// tesjdckc
  final topic;
  // test pull origin
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  NewWordPage(id: topic['id'])),
        );
      },
      child: Container(
        width: 150,
        // height: 220,
        decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1))
            ]),
        child: Column(
          children: [
            Container(
              // width: 200,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(topic['image']),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    topic["name"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}