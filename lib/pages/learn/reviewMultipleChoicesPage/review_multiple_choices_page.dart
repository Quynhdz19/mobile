import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/reviewMultipleChoicesPage/components/question_card.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/review_question_data.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';

class ReviewMultipleChoicesPage extends StatelessWidget {
  const ReviewMultipleChoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  color: primaryColor,
                ),
              ),
            ],
          ),
          ProcessBar(rate: 0.5),
          SizedBox(
            height: 10,
          ),
          QuestionCard(reviewQuestion: reviewQuestions[0],),
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "CHECK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                foregroundColor: whiteColor,
                backgroundColor: lightPrimaryColor,
                side: BorderSide(color: lightPrimaryColor),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              style: Theme.of(context).textButtonTheme.style,
            ),
          ),
        ],
      ),
    );
  }
}
