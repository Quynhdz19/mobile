import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Container(
            width: 500,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("assets/images/quizgame.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Spacer(),
          Center(
            child: Text(
              "Let's Play Quiz",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
                onPressed: () {},
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
                    foregroundColor: whiteColor,
                    backgroundColor: lightPrimaryColor,
                    side: BorderSide(color: lightPrimaryColor),
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 110))),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
