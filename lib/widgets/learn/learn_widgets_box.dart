import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/color.dart';

class LearnWidgetsBox extends StatelessWidget {
  const LearnWidgetsBox(
      {Key? key,
        required this.imageUrl,
        required this.title,
        required this.description,
        this.onTab
      })
      : super(key: key);

  final String imageUrl;
  final String title;
  final String description;
  final GestureTapCallback? onTab;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ]),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}