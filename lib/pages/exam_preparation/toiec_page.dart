import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/exam_preparation/components/exam_list_item.dart';

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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          "Toiec tests",
        ),
      ),
      body: Container(
        color: isDarkMode ? darkBackgroundColor : Colors.white,
        child: Column(
          children: [
            Container(
              child: TabBar(
                controller: _tabController,
                // isScrollable: true,
                labelColor: favoriteColor,
                unselectedLabelColor: Color.fromRGBO(113, 188, 191, 1),
                indicatorColor: favoriteColor,
                tabs: [
                  Tab(
                      child: Text(
                    'Mini test',
                    style: TextStyle(fontSize: 20),
                  )),
                  Tab(
                    child: Text(
                      'Full test',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height - 170,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: GridView.count(
                      childAspectRatio: 1,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(
                        8,
                        (index) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: ExamListItem(index: index,)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/practicetitle.png',
                        width: 300,
                      ),
                      const SizedBox(
                        height: 20,
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
