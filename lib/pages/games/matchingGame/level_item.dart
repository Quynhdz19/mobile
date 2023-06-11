import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class LevelItem extends StatelessWidget {
  const LevelItem(
      {required this.imageUrl,
      required this.title,
      required this.color,
      Key? key,
      required this.stars})
      : super(key: key);

  final String imageUrl;
  final String title;
  final Color color;
  final int stars;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 100,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: generateStar(stars),
                      ),
                    )

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(imageUrl),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> generateStar(int number) {
    List<Widget> starIcon = [];
    for (int i = 0; i < number; i++) {
      starIcon.insert(
          i,
          Icon(
            Icons.star,
            color: Color(0xFFF9A825),
          ));
    }
    return starIcon;
  }
}
