import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          color: scrambleBackgroundColor,
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        _navigationService.navigateTo(routes.GamesPage, arguments: {});
                      },
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 40,
                        color: scrambleBackgroundButtonColor,
                      ),
                    ),
                  ]
                ),
                Image.asset(
                  "assets/images/scramble_welcome.png",
                  width: 240,
                ),
                SizedBox(
                  height: 15,
                ),
                ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.color),
                    child: Image.asset("assets/images/scramble_welcome_content.jpg")
                ),
                Spacer(flex: 3),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                      _navigationService.navigateTo(routes.ScrambleGameScrambleWordPage, arguments: {});

                    },
                    child: Text(
                      'start'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      foregroundColor: scrambleBackgroundButtonColor,
                      backgroundColor: scrambleBackgroundButtonColor,
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
