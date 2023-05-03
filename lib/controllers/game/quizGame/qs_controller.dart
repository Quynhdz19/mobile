import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  //animated time bar
  late AnimationController _animationController;
  late Animation _animation;
  Map<dynamic, dynamic> ?myList = null;

  //access our animation outside
  Animation get animation => this._animation;

  //page controller
  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  Future<List<Quiz>> readQuestions() async {
    List<Quiz> listQuiz = (await FirebaseFirestore.instance
        .collection('quiz')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Quiz.fromJson(doc.data())).toList())) as List<Quiz>;
    return listQuiz;
  }

  //list quiz
  List<Quiz> _quizzes = quizQuestions
      .map(
        (quiz) => Quiz(
      id: quiz["id"],
      question: quiz["question"],
      answer_id: quiz["answer_id"],
      options: quiz["options"],
    ),
  )

      .toList();

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
      _navigationService.navigateTo("ScorePage", arguments: myList!);
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
