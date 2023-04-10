import 'package:flutter/material.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ScrambleWelcomePage extends StatelessWidget {
  ScrambleWelcomePage({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(159, 204, 195, 1),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  "assets/images/welcome.png",
                  width: 240,
                ),
                SizedBox(
                  height: 15,
                ),
                Image.asset("assets/images/wordscramblewelcome.png"),
                Spacer(flex: 3),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _navigationService.navigateTo(routes.GrammarPage);
                    },
                    child: const Text(
                      "START",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      foregroundColor: scrambleGreenColor,
                      backgroundColor: scrambleGreenColor,
                      side: BorderSide(color: whiteColor),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 110),
                    ),
                  ),
                ),
                Spacer(),

              ],
            ),
          ),
        )
      )
    );
  }
}
