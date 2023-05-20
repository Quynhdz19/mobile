import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ExamListItem extends StatelessWidget {
  ExamListItem({Key? key, required this.index}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  final int index;
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
                height: 100,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.ctfassets.net/61zr8ugl0z48/7oMpywgUsiFR8n6Hse1QhE/2448747dc6b8269ccd7687dd9dbf4ea5/iStock-492198113.jpg?w=3000&q=50")),
                    borderRadius: BorderRadius.circular(20))),
            Text(
              "Mini test 1",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: primaryColor),
            ),
            Text("1000"),
            Text("participants"),
          ],
        ),
      ),
    );
  }
}
