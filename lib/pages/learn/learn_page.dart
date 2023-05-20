
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

import '../common_component/LeftSideBar.dart';

import 'learnPage/components/learn_widgets_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class LearnPage extends StatefulWidget {
  LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage>
    with TickerProviderStateMixin{
  final NavigationService _navigationService = locator<NavigationService>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //    title:   Text(
      //         'lessons'.tr,
      //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //       ),
      // ),
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('lessons'.tr, style: TextStyle(fontSize: 18),),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: TabBar(
                controller: _tabController,
                // isScrollable: true,
                labelColor: favoriteColor,
                unselectedLabelColor:
                Color.fromRGBO(113, 188, 191, 1),
                indicatorColor: favoriteColor,
                tabs: [
                  Tab(child: Text('Learn',
                  style: TextStyle(fontSize: 20),)
                  ),
                  Tab(child: Text('Practice',
                      style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
              // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height - 170,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/learntitle.png', width: 300,),
                      const SizedBox(
                        height: 20,
                      ),
                            LearnWidgetsBox(
                                imageUrl:
                                    "assets/images/learnbytopic.png",
                                title: 'learn_by_topic_title'.tr,
                                description: 'learn_by_topic_desc'.tr,
                                onPressed: () { _navigationService.navigateTo(routes.AllTopic, arguments: {} );},
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            LearnWidgetsBox(
                                imageUrl: "assets/images/learnbyvideo.png",
                                title: 'learn_by_video_title'.tr,
                                description: 'learn_by_video_desc'.tr,
                                onPressed: () { _navigationService.navigateTo(routes.LearnVideo, arguments: {} );},
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            LearnWidgetsBox(
                                imageUrl:
                                    "assets/images/learnbygr.png",
                                title: 'basic_grammar_title'.tr,
                                description: 'basic_grammar_desc'.tr,

                                onPressed: () { _navigationService.navigateTo(routes.GrammarPage, arguments: {});},
                           ),

                            // const SizedBox(
                            //   height: 30,
                            // ),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/practicetitle.png', width: 300,),
                      const SizedBox(
                        height: 20,
                      ),
                      LearnWidgetsBox(
                        imageUrl:
                        "assets/images/listenandwrite.png",
                        title: 'practice_vocab_title'.tr,
                        description: 'practice_vocab_desc'.tr,
                        onPressed: () { _navigationService.navigateTo(routes.LearnPracticeLW, arguments: {} );},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LearnWidgetsBox(
                        imageUrl:
                        "assets/images/listenandwrite.png",
                        title: 'practice_vocab_title'.tr,
                        description: 'practice_vocab_desc'.tr,
                        onPressed: () { _navigationService.navigateTo(routes.LearnPracticeLW, arguments: {} );},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
