import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ExamListItem extends StatelessWidget {
  ExamListItem({Key? key, required this.index, required this.title}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: lightOrangeColor),
      child: GestureDetector(
        onTap: () {
          _navigationService.navigateTo(routes.PreTestPage, arguments: {});
        },
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/1148585703/vector/online-exam-online-training-courses-online-book-distance-education-vector-illustration-flat.jpg?s=612x612&w=0&k=20&c=R3UaQhn2xYNLlpVb-M37Sb0DJxZaXKAQ7rCYM5EyyQ0=")),
                    borderRadius: BorderRadius.circular(20))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: primaryColor),
                ),
                const SizedBox(width: 10,),
                Text(
                    (index+1).toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: primaryColor),
                ),
              ],
            ),
            Text("1000"),
            Text("participants"),
          ],
        ),
      ),
    );
  }
}
