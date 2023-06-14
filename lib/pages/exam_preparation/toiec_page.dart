import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/exam_preparation/practice_controller.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/fullTest/exam_list_item.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/practice_item.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/pratice/practice_page.dart';

import '../../utils/constants.dart';
import '../common_component/LeftSideBar.dart';

class ToiecPage extends StatefulWidget {
  const ToiecPage({Key? key}) : super(key: key);

  @override
  State<ToiecPage> createState() => _ToiecPageState();
}

class _ToiecPageState extends State<ToiecPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  PracticeController _practiceController = Get.put(PracticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Toeic tests",
            style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
              ),
              child: TabBar(
                controller: _tabController,
                // isScrollable: true,
                labelColor: favoriteColor,
                unselectedLabelColor: Color.fromRGBO(113, 188, 191, 1),
                indicatorColor: favoriteColor,
                tabs: [
                  Tab(
                      child: Text(
                    'Practice',
                    style: TextStyle(fontSize: 18),
                  )),
                  Tab(
                    child: Text(
                      'Full test',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height - 150,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text("Practice Listening",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: primaryColor)),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PracticeItem(
                              imageUrl:
                                  'https://freeiconshop.com/wp-content/uploads/edd/image-outline-filled.png',
                              title: 'Photographs',
                              part: 1,
                              backgroundColor: Color(0xFFFCE4EC),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                      pageId: 1,
                                        title: "Part 1: Photographs",
                                        jsonPath:
                                            'assets/data/practice_part1.json'),
                                  ),
                                );
                              },
                            ),
                            PracticeItem(
                              imageUrl:
                                  'https://cdn-icons-png.flaticon.com/512/5726/5726470.png',
                              title: 'Question response',
                              part: 2,
                              backgroundColor: Color(0xFFE3F2FD),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                        pageId: 2,
                                        title: "Part 2: Question response",
                                        jsonPath:
                                            'assets/data/practice_part2.json'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PracticeItem(
                              imageUrl:
                                  'https://cdn-icons-png.flaticon.com/256/4150/4150860.png',
                              title: 'Conversation',
                              part: 3,
                              backgroundColor: Color(0xFFFFFDE7),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                        pageId: 3,
                                        title: "Part 3: Conversation",
                                        jsonPath:
                                            'assets/data/practice_part3.json'),
                                  ),
                                );
                              },
                            ),
                            PracticeItem(
                              imageUrl:
                                  'https://cdn-icons-png.flaticon.com/512/1000/1000384.png',
                              title: 'Short talks',
                              part: 4,
                              backgroundColor: Color(0xFFEDE7F6),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                        pageId: 4,
                                        title: "Part 4: Short talks",
                                        jsonPath:
                                            'assets/data/practice_part3.json'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 10,),
                        Text("Practice Reading",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: primaryColor)),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PracticeItem(
                              imageUrl:
                                  'https://cdn-icons-png.flaticon.com/512/3626/3626788.png',
                              title: 'Incomplete sentences',
                              part: 5,
                              backgroundColor: Color(0xFFE8F5E9),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                        pageId: 5,
                                        title: "Part 5: Incomplete sentences",
                                        jsonPath:
                                            'assets/data/practice_part3.json'),
                                  ),
                                );
                              },
                            ),
                            PracticeItem(
                              imageUrl:
                                  'https://cdn-icons-png.flaticon.com/512/4901/4901662.png',
                              title: 'Text completion',
                              part: 6,
                              backgroundColor: Color(0xFFFBE9E7),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                        pageId: 6,
                                        title: "Part 6: Text completion",
                                        jsonPath:
                                            'assets/data/practice_part3.json'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PracticeItem(
                              imageUrl:
                                  'https://cdn-icons-png.flaticon.com/512/3068/3068421.png',
                              title: 'Reading',
                              part: 7,
                              backgroundColor: Color(0xFFE8EAF6),
                              callbackFunc: () {
                                _practiceController.replayGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PracticePage(
                                      pageId: 7,
                                        title: "Part 7: Reading",
                                        jsonPath:
                                            'assets/data/practice_part3.json'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: GridView.count(
                      childAspectRatio: 0.8,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(
                        8,
                        (index) => ExamListItem(
                              index: index,
                              title: "Full test",
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
