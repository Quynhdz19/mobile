import 'package:flutter/material.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ScrambleWordHeader extends StatelessWidget {
  ScrambleWordHeader({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              _navigationService.goBack();
            },
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
            icon: const Icon(
              Icons.healing_outlined,
              size: 30,
              color: scrambleGreenColor,
            ),
          ),

          Image.asset("assets/images/wordscramblecontent.png",
              width: 160),
          Row(
            children: [
              IconButton(
                onPressed: () {
                },
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: scrambleGreenColor,
                ),
              ),
              IconButton(
                onPressed: () {
                },
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: scrambleGreenColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
