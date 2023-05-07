// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../../models/games/topic_word.dart';
// import '../../services/locator.dart';
// import '../../services/navigation_service.dart';
//
// class TopicController extends GetxController {
//   final NavigationService _navigationService = locator<NavigationService>();
//   //animated time bar
//   late AnimationController _animationController;
//   late Animation _animation;
//
//   //access our animation outside
//   Animation get animation => this._animation;
//
//   //page controller
//   PageController _pageController = PageController();
//   PageController get pageController => this._pageController;
//
//
//   //called after the widget is allocated memory
//   @override
//   void onInit() {
//     _animationController =
//         AnimationController(duration: Duration(seconds: 60), vsync: (){});
//     _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
//       ..addListener(() {
//         //update like state
//         update();
//       });
//
//     //start our animation
//     //once 60s is completed go to the next
//     _animationController.forward().whenComplete(nextQuestion);
//     _pageController = PageController();
//     super.onInit();
//   }
//
//   //called just before the controller is deleted from memory
//   @override
//   void onClose() {
//     super.onClose();
//     _animationController.dispose();
//     _pageController.dispose();
//   }
//
//   void nextQuestion() {
//     if (_questionNumber.value != _quizzes.length) {
//       _isAnswered = false;
//       _pageController.nextPage(
//           duration: Duration(milliseconds: 250), curve: Curves.ease);
//
//       //reset the counter
//       _animationController.reset();
//
//       //then start it again
//       //once timer is finish go to the next qn
//       // _animationController.forward().whenComplete(nextQuestion);
//     // } else {
//       _navigationService.navigateTo("ScorePage", arguments: {});
//     }
//   }
//
//   void updateTheQnNum(int index) {
//     _questionNumber.value = index + 1;
//   }
//
//   void pauseGame() {
//     _animationController.stop();
//     update();
//   }
//
//   void continueGame() {
//     _animationController.forward();
//     update();
//   }
//
//   void replayGame() {
//     _questionNumber.value = 1;
//     _pageController = PageController();
//     _numOfCorrectAns = 0;
//     _isAnswered = false;
//     _animationController.reset();
//     _animationController.forward().whenComplete(nextQuestion);
//   }
// }
