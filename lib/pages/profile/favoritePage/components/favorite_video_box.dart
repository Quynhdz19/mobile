import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/pages/learn/video/components/video_container.dart';

class FavoriteVideoBox extends StatelessWidget {
  const FavoriteVideoBox({Key? key, required this.video}) : super(key: key);
  final video;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerComponent(videos: video!),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarkMode ? darkBackgroundColor : lightBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    video['image_url'],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video['description'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDarkMode ? darkTextColor2 : favoriteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    video['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time,
                    color: isDarkMode ? darkTextColor2 : favoriteColor,
                    size: 23,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    video['time'],
                    style: TextStyle(
                      color: isDarkMode ? darkTextColor2 : favoriteColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 1))
                    ]),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 23,
                    ),
                    color: Colors.red),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
