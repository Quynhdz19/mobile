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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5,10,0,0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  color: primaryColor,
                ),
              ),
              const ProcessBar(rate: 0.5),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          QuestionCard(reviewQuestion: reviewQuestions[0],),
          const SizedBox(
            height: 40,
          ),
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
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
              ),
              child: const Text(
                "CHECK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: Theme.of(context).textButtonTheme.style,
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
