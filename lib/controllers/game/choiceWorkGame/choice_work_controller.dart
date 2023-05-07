import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/models/games/choice_work.dart';
import 'package:mobile_front_end/models/games/work_topic.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/data/quiz_question_data.dart';

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

  var _topics = <WorkTopic>[];
  var _works = <ChoiceWork>[];

  Future<void> getTopics () async {
    try {
      QuerySnapshot topicData = await FirebaseFirestore.instance.collection('choice-work').get();
      _topics.clear();
      for (var topic in topicData.docs) {
        _topics.add(
            WorkTopic(id: topic["id"], name: topic["name"], imgUrl: topic["image"], desc: topic["desc"])
        );
      }
    } catch (e) {
      Get.snackbar("Error", '${e.toString()}');
    }

  }

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
            print("123456: ${quiz['question']}");
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
  List<WorkTopic> get topics => this._topics;

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
    getTopics();
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
    // QuerySnapshot topicData = await FirebaseFirestore.instance.collection('choice-work').get();
    // _topics.clear();
    // for (var topic in topicData.docs) {
    //   _topics.add(
    //       WorkTopic(id: topic["id"], name: topic["name"], imgUrl: topic["image"], desc: topic["desc"])
    //   );
    // }
    // // _topics.map((e) => {
    // //   if (e.id == id) {
    // //     _workTopicName = e.name,
    // //     _workTopicDesc = e.desc,
    // //   }
    // // });
    // for (var topic in _topics) {
    //   if (topic.id == id) {
    //
    //   }
    // }
  }

  void checkAns(ChoiceWork work, int selectedIndex) {
    //
    _isAnswered = true;
    _correctAns = work.answer_id;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
    update();

  }

  void nextQuestion() {
    if (_questionNumber.value != _works.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
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