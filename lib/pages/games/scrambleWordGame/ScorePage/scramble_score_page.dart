import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants.dart';
import '../../../../../services/locator.dart';
import '../../../../../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../wordPage/components/scramble_word_body.dart';

class ScrambleScorePage extends StatelessWidget {
  //ScrambleScorePage({Key? key,}) : super(key: key);
  final numCorrectAns;
  final numQuestion;
  ScrambleScorePage({required this.numCorrectAns, required this.numQuestion});
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Center(
                child: Text(
                  "Result",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "COMPLETE!",
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold,
                  //     letterSpacing: 8,
                  //   ),
                  // ),
                  // Image.asset(
                  //   "assets/images/champion.png",
                  //   width: 200,
                  // ),
                  Container(
                    height: 300,
                    child: (numCorrectAns >
                        (numQuestion/ 2).floor())
                        ? Image.asset('assets/images/happy_image.png')
                        : Image.asset('assets/images/sad_image.png'),
                        // ? Lottie.network(
                        // 'https://assets1.lottiefiles.com/private_files/lf30_kgqkerwk.json')
                        // : Lottie.network(
                        // 'https://assets4.lottiefiles.com/packages/lf20_lU3NKnhMxq.json'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "YOUR SCORE",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${numCorrectAns * 10}/${numQuestion * 10}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        letterSpacing: 6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
                    // child: Column(
                    //   children: [
                    //     Text.rich(
                    //       TextSpan(children: <TextSpan>[
                    //         TextSpan(
                    //             text: "Your attempt ",
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 18,
                    //             )),
                    //         TextSpan(
                    //             text: "${numQuestion} questions",
                    //             style: TextStyle(
                    //               color: primaryColor,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             )),
                    //         TextSpan(
                    //             text: " and",
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 18,
                    //             )),
                    //       ]),
                    //     ),
                    //     Text.rich(
                    //       TextSpan(children: <TextSpan>[
                    //         TextSpan(
                    //             text: "from that ",
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 18,
                    //             )),
                    //         TextSpan(
                    //             text: "${numCorrectAns} answer",
                    //             style: TextStyle(
                    //               color: Colors.green,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             )),
                    //         TextSpan(
                    //             text: " is correct.",
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 18,
                    //             )),
                    //       ]),
                    //     ),
                    //   ],
                    // ),
                    child: Text('Your score is ${numCorrectAns} out of ${numQuestion}',
                    style: TextStyle(color: Colors.black, fontSize: 20,)
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _navigationService
                          .navigateTo(routes.GamesPage, arguments: {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Quit",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: whiteColor,
                      backgroundColor: whiteColor,
                      side: BorderSide(color: Colors.red),
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _navigationService.navigateTo(
                          routes.ScrambleGameWelcomePage,
                          arguments: {});
                    },
                    child: Row(
                      children: [
                        Icon(Icons.repeat),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Replay",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: whiteColor,
                      backgroundColor: primaryColor,
                      side: BorderSide(color: primaryColor),
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
