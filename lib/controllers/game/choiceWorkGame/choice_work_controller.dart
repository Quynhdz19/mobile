import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

class ChoiceWorkController extends GetxController with GetSingleTickerProviderStateMixin {
  //page controller
  final NavigationService _navigationService = locator<NavigationService>();

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  List<ChoiceWork> _works =
      qs.map(
        (work) => ChoiceWork(
      id: work["id"],
      question: work["question"],
      answer_id: work["answer_id"],
      options: work["options"],
    ),
  ).toList();

  List<ChoiceWork> get works => this._works;

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
    _pageController = PageController();
    super.onInit();
  }

  //called just before the controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void checkAns(ChoiceWork work, int selectedIndex) {
    //
    _isAnswered = true;
    _correctAns = work.answer_id;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
  }

  void nextQuestion() {
    if (_questionNumber.value != _works.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      //then start it again
      //once timer is finish go to the next qn

    } else {
      _navigationService.navigateTo("ChoiceWorkScore");
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void replayGame() {
    _questionNumber.value = 1;
    _pageController = PageController();
    _numOfCorrectAns = 0;
    _isAnswered = false;
  }

}