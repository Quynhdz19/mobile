import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/Quiz.dart';
import 'package:mobile_front_end/pages/games/quizGame/quizPage/components/quiz_option.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/board.png")),
            ),
            child: Center(
              child: Container(
                width: 180,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    quiz.question,
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ...List.generate(
              quiz.options.length,
              (index) => QuizOption(
                    index: index,
                    choice: quiz.options[index],
                  )),
          Container(
            width: 150,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.navigate_next),
                  SizedBox(width: 4,),
                  Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
                backgroundColor: lightPrimaryColor,
                side: BorderSide(color: lightPrimaryColor),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
            ),
          ),
        ],
      ),
    );
    // );
    //   Expanded(
    //   child: Column(
    //     children: <Widget> [
    //       Center(
    //         child: Text(
    //           quiz.requirement,
    //           style: Theme.of(context).textTheme.headline5,
    //         ),
    //       ),
    //       SizedBox(
    //         height: defaultPadding,
    //       ),
    //       Container(
    //           width: double.infinity,
    //           // height: 100,
    //           padding: EdgeInsets.all(defaultPadding),
    //           decoration: BoxDecoration(
    //             color: lightBackgroundColor,
    //             borderRadius: BorderRadius.circular(25),
    //           ),
    //           child: Center(
    //             child: Text(
    //               quiz.question,
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //               style: Theme.of(context).textTheme.headline4,
    //             ),
    //           )),
    //       SizedBox(
    //         height: defaultPadding/2,
    //       ),
    //       GridView.count(
    //         childAspectRatio: 1.5,
    //         crossAxisCount: 2,
    //         shrinkWrap: true,
    //         children: List.generate(
    //           quiz.options.length,
    //           (index) => Padding(
    //             padding: const EdgeInsets.only(left: 5, right: 5),
    //             child: QuizOption(
    //               choice: quizQuestions[0]["options"][index],
    //               index: index + 1,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
