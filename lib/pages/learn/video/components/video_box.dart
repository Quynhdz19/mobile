import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/video/components/video_container.dart';

import '../../../../utils/constants.dart';

class VideoBoxContainer extends StatelessWidget {
    const VideoBoxContainer(
      {Key? key,
      required this.videoUrl,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.time,
      this.onPressed})
      : super(key: key);

  final String videoUrl;
  final String imgUrl;
  final String title;
  final String description;
  final String time;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: lightBackgroundColor),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                child: Image.asset(
                  imgUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Text(
                    time,
                    style: Theme.of(context).textTheme.headline4,
                  )),
            ]),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            description,
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
