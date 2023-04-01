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
          const Spacer(),
          Container(
            width: 500,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              image: const DecorationImage(
                  image: AssetImage("assets/images/quizgame.png"),
                  fit: BoxFit.cover),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              "Let's Play Quiz",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: whiteColor,
                    backgroundColor: lightPrimaryColor,
                    side: const BorderSide(color: lightPrimaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 110)),
                child: const Text(
                  "START",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
