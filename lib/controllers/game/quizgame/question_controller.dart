import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_front_end/models/Quiz.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';
import 'package:mobile_front_end/models/ReviewQuestion.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //animated time bar
  late AnimationController _animationController;
  late Animation _animation;

  //access our animation outside
  Animation get animation => this._animation;

  List<Quiz> _quizzes = quizQuestions
      .map((quiz) => Quiz(
            id: quiz["id"],
            requirement: quiz["requirement"],
            question: quiz["question"],
            answer_id: quiz["answer_id"],
            options: quiz["options"],
          ))
      .toList();

  List<Quiz> get quizzes => this._quizzes;

  //called after the widget is allocated memory
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        //update like state
        update();
      });

    //start our animation
    _animationController.forward();
    super.onInit();
  }
}
