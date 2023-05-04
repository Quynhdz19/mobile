import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/services/navigation_service.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  //animated time bar
  late AnimationController _animationController;
  late Animation _animation;

  //access our animation outside
  Animation get animation => this._animation;

  //page controller
  PageController _pageController = PageController();
  PageController get pageController => this._pageController;


  var _quizzes = <Quiz>[];

  Future<void> getData() async {
    try {
      QuerySnapshot quizdata =
          await FirebaseFirestore.instance.collection('quiz-game').get();
      _quizzes.clear();

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
        _quizzes.add(
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




  List<Quiz> get quizzes => this._quizzes;

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
    //once 60s is completed go to the next
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

  void checkAns(Quiz quiz, int selectedIndex) {
    //
    _isAnswered = true;
    _correctAns = quiz.answer_id;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
    //stop the counter
    _animationController.stop();
    update();
    //once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _quizzes.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      //reset the counter
      _animationController.reset();

      //then start it again
      //once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      _navigationService.navigateTo("ScorePage", arguments: {});
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
    _isAnswered = false;
    _animationController.reset();
    _animationController.forward().whenComplete(nextQuestion);
  }
}
