import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class FavoriteTopicBox extends StatelessWidget {
  FavoriteTopicBox({Key? key, required this.topic, this.onTab}) : super(key: key);

  final topic;
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 200,
        height: 220,
        decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ]),
          child: Column(
            children: [
              Container(
                // width: 200,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(topic["image"]),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        topic["name"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        topic["description"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${topic["word"]} word",
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
    );
  }
}
