import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/video/components/video_container.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import '../../../../utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class VideoBoxContainer extends StatelessWidget {
   VideoBoxContainer({Key? key, required this.videos, this.onPressed})
      : super(key: key);
  final videos;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerComponent(videos: videos!),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(videos["image_url"]),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
                      child: Text(
                        videos['time'],
                        style: Theme.of(context).textTheme.headlineMedium,
                      )),
                ),
              ),
            ]),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            videos['name'],
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            videos['description'],
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
