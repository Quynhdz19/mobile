import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';


class ReadingQsController extends GetxController with GetSingleTickerProviderStateMixin {
  //page controller
  final NavigationService _navigationService = locator<NavigationService>();
  late AnimationController _animationController;
  late Animation _animation;

  //access our animation outside
  Animation get animation => this._animation;

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  var _questions = <Quiz>[];

  Future<void> getData() async {
    try {
      QuerySnapshot quizdata =
      await FirebaseFirestore.instance.collection('quiz-game').get();
      _questions.clear();

      // Generate 10 unique random qs
      Random random = Random();
      List<dynamic> quizList = [];

      Set<int> indices = {};
      while (indices.length < 10) {
        int numRandom = random.nextInt(quizdata.docs.length);
        if (indices.contains(numRandom) == false && numRandom >= 0) {
          indices.add(numRandom);
        }
      }

      for (int index in indices) {
        quizList.add(quizdata.docs[index]);
      }

      for (var quiz in quizList) {
        // Access the array using the data() method
        List<dynamic> optionsData = quiz['options'];

        // Cast the array elements to the desired type
        List<String> optionList = optionsData.cast<String>();
        _questions.add(
          Quiz(
            id: quiz.id,
            question: quiz['question'],
            answer_id: quiz['answer_id'],
            options: optionList,
          ),
        );
        // (quiz['options']);
      }
    } catch (e) {
      Get.snackbar("Error", '${e.toString()}');
    }
  }

  List<Quiz> get questions => this._questions;

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
  
  void checkAns(Quiz question, int selectedIndex) async {
    _isAnswered = true;
    _correctAns = question.answer_id;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
    update();

  }

  void nextQuestion() async {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // _navigationService.navigateTo("", arguments: {});
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
    _questionNumber.value = 0;
    _pageController = PageController();
    _numOfCorrectAns = 0;
    _isAnswered = false;
    _animationController.reset();
  }

}