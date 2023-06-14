import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/models/exam/TestComponent.dart';
import 'package:mobile_front_end/models/exam/TestQuestion.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;
import 'package:mobile_front_end/utils/data/reading_toeic.dart';

class PracticeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //page controller
  final NavigationService _navigationService = locator<NavigationService>();

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  var _components = <TestComponent>[];
  var _questions = <TestQuestion>[];
  void getReadingPart5Data(){
    _questions = ReadingToeicData.map(
          (quiz) => TestQuestion(
        id: quiz["id"],
        question: quiz["question"],
        status: quiz["status"],
        selected_id: quiz["selected_id"],
        answer_id: quiz["answer_id"],
        options: quiz["options"],
      ),
    ).toList();
  }

  void getReadingPart6Data(){
    _components = ReadingPart6Data.map(
        (component) {
          List<dynamic> _allqs = component["questions"].map(
              (quiz) => TestQuestion(
                id: quiz["id"],
                question: quiz["question"],
                status: quiz["status"],
                selected_id: quiz["selected_id"],
                answer_id: quiz["answer_id"],
                options: quiz["options"],
              )
          ).toList();
          List<TestQuestion> allqs = _allqs.cast<TestQuestion>();
          return TestComponent(
            id: component["id"],
            requirement: component["requirement"],
            questions: allqs,
          );
        }
    ).toList();
    for (var component in _components) {
      _questions.addAll(component.questions);
    }
  }

  List<TestQuestion> get questions => this._questions;
  List<TestComponent> get components => this._components;

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
    _pageController = PageController();
    super.onInit();
  }

  //called just before the controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
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

  void checkMultipleAns(TestQuestion question, int selectedIndex) async {
    _isAnswered = true;
    _correctAns = question.answer_id;
    _selectedAns = selectedIndex;
    if (question.answer_id == selectedIndex) {
        _numOfCorrectAns++;
        question.status = 1;
        question.selected_id = selectedIndex;
        _questions[question.id].status = 1;
        _questions[question.id].selected_id = selectedIndex;
      } else if (question.answer_id != selectedIndex) {
        _numOfWrongAns++;
        question.status = 2;
        question.selected_id = selectedIndex;
        _questions[question.id].status = 2;
        _questions[question.id].selected_id = selectedIndex;
      }
    update();
  }

  void nextQuestion() async {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      _navigationService.navigateTo(routes.ToiecPracticeScore, arguments: {});
    }
  }

  void nextPage() async {
    if (_questionNumber.value != _components.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      _navigationService.navigateTo(routes.ToiecPracticeScore, arguments: {});
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
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
  }
}
