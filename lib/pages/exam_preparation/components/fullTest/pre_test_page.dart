import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../services/locator.dart';
import '../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class PreTestPage extends StatefulWidget {
  const PreTestPage({Key? key}) : super(key: key);

  @override
  State<PreTestPage> createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFE1F5FE),
            child: GestureDetector(
              onTap: () {
                _navigationService.navigateTo(routes.ToiecPage, arguments: {});
              },
              child: Icon(Icons.chevron_left, color: Colors.black26,),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.alarm,
                color: Color(0xFFE57373),
              ),
              const SizedBox(width: 10),
              Text(
                "01:00:00",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: primaryColor),
              )
            ],
          ),
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://trangkorean.com/wp-content/uploads/2019/09/IMG_3693-1.jpg")),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _navigationService
                    .navigateTo(routes.ToiecExamPage, arguments: {});
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24)),
              child: Text("Take Test"))
        ],
      ),
    );
  }
}
