import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class IBoxCommmon extends StatelessWidget {
  const IBoxCommmon(
      {Key? key,
        required this.imageUrl,
        required this.title,
        required this.backgroundColor,
        required this.onTap,
        required this.width
      })
      : super(key: key);

  final String imageUrl;
  final String title;
  final Color backgroundColor;
  final GestureTapCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
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
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
