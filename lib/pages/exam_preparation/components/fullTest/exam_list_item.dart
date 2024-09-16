import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ExamListItem extends StatelessWidget {
  ExamListItem({Key? key, required this.index, required this.title})
      : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor, width: 0.5),
          color: isDarkMode ? darkBackgroundColor : lightOrangeColor),
      child: GestureDetector(
        onTap: () {
          _navigationService.navigateTo(routes.PreTestPage, arguments: {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                // width: double.infinity,
                height: 140,
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/1148585703/vector/online-exam-online-training-courses-online-book-distance-education-vector-illustration-flat.jpg?s=612x612&w=0&k=20&c=R3UaQhn2xYNLlpVb-M37Sb0DJxZaXKAQ7rCYM5EyyQ0="),
                        fit: BoxFit.fitHeight),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${title} ${(index + 1).toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: primaryColor),
                ),
              ],
            ),
            SizedBox(height: 3,),
            Text("100 participants",
                style: TextStyle(color: isDarkMode ? darkTextColor2 : favoriteColor, fontSize: 12,)),
          ],
        ),
      ),
    );
  }
}
