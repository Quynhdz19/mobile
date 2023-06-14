import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class PracticeItem extends StatelessWidget {
  const PracticeItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.part,
      required this.backgroundColor, required this.callbackFunc})
      : super(key: key);

  final String imageUrl;
  final String title;
  final int part;
  final Color backgroundColor;
  final GestureTapCallback callbackFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackFunc,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(imageUrl))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Part",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        part.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      )
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 160,
              height: 50,
              alignment: Alignment.center,
              child: Center(
                 child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
