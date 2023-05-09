import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';

import '../../common/audio_manager.dart';

class ChoiceWorkController extends GetxController with GetSingleTickerProviderStateMixin {
  //page controller
  final NavigationService _navigationService = locator<NavigationService>();

  PageController _pageController = PageController();
  PageController get pageController => this._pageController;

  String _workTopic = "";
  String get workTopic => this._workTopic;

  String _workTopicName = "";
  String get workTopicName => this._workTopicName;

  String _workTopicDesc = "";
  String get workTopicDesc => this._workTopicDesc;

  var _works = <ChoiceWork>[];

  Future<void> getWorks () async {
    try {
      await FirebaseFirestore.instance.collection('choice-work').doc(_workTopic).get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic>? topicdata = documentSnapshot.data();
          _works.clear();
          // print("12345: ${documentSnapshot.data()}");
          _workTopicName = topicdata!["name"];
          _workTopicDesc = topicdata!["desc"];
          for (var quiz in topicdata!["question_list"]) {
            // print("123456: ${quiz['question']}");
            // Access the array using the data() method
            List<dynamic> qsData =  quiz['question'];
            List<dynamic> optionsData = quiz['options'];

            // Cast the array elements to the desired type
            List<String> qsList = qsData.cast<String>();
            List<String> optionList = optionsData.cast<String>();
            _works.add(
              ChoiceWork(
                id: quiz["id"],
                question: qsList,
                answer_id: quiz['answer_id'],
                options: optionList,
              ),
            );

          }
        }
      });
    } catch(e) {
      Get.snackbar("Error", '${e.toString()}');
    }
  }

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

  void setWorkTopic(String id) async {
    _workTopic = id;
  }

  void checkAns(ChoiceWork work, int selectedIndex) async {
    //
    _isAnswered = true;
    _correctAns = work.answer_id;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      await AudioManager.playAudio('correct');
      _numOfCorrectAns++;
    } else {
      await AudioManager.playAudio('incorrect');
    }
    update();

  }

  void nextQuestion() async {
    if (_questionNumber.value != _works.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      await AudioManager.playAudio('round');
      _navigationService.navigateTo("ChoiceWorkScore", arguments: {});
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void replayGame() {
    _questionNumber.value = 0;
    _pageController = PageController();
    _numOfCorrectAns = 0;
    _isAnswered = false;
  }

}