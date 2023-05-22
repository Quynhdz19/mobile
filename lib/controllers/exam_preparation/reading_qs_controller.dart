import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/models/exam/TestQuestion.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;
import 'package:mobile_front_end/utils/data/reading_toeic.dart';

class ReadingQsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //page controller
  final NavigationService _navigationService = locator<NavigationService>();
  late AnimationController _animationController;
  late Animation _animation;

  //access our animation outside
  Animation get animation => this._animation;

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  List<TestQuestion> _questions = ReadingToeicData.map(
    (quiz) => TestQuestion(
      id: quiz["id"],
      question: quiz["question"],
      status: quiz["status"],
      selected_id: quiz["selected_id"],
      answer_id: quiz["answer_id"],
      options: quiz["options"],
    ),
  ).toList();

  List<Object> _wrongAnswerList = [];
  List<TestQuestion> get questions => this._questions;
  List<Object> get wrongAnswerList => this._wrongAnswerList;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns = -1;
  int get correctAns => this._correctAns;

  int _selectedAns = -1;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  int _numOfWrongAns = 0;
  int get numOfWrongAns => this._numOfWrongAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 3600), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        //update like state
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  //called just before the controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(TestQuestion question, int selectedIndex) async {
    _isAnswered = true;
    _correctAns = question.answer_id;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
      question.status = 1;
      question.selected_id = selectedIndex;
    } else if (_correctAns != _selectedAns) {
      _numOfWrongAns++;
      question.status = 2;
      question.selected_id = selectedIndex;
    }
    update();
  }

  String getAnswer(int answer_id) {
    if (answer_id == 0) {
      return "A";
    } else if (answer_id == 1) {
      return "B";
    } else if (answer_id == 2) {
      return "C";
    } else {
      return "D";
    }
  }

  void nextQuestion() async {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      _navigationService.navigateTo(routes.ToiecReadingScore, arguments: {});
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void pauseGame() {
    _animationController.stop();
    update();
  }

  void continueGame() {
    _animationController.forward();
    update();
  }

  void replayGame() {
    _questionNumber.value = 1;
    _pageController = PageController();
    _numOfCorrectAns = 0;
    _numOfWrongAns = 0;
    for (var qs in _questions) {
      qs.status = 0;
      qs.selected_id = 5;
    }
    _isAnswered = false;
    _animationController.reset();
    _animationController.forward();
  }
}
