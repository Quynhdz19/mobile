import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/exam_preparation/ielts/component/i_widget.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/constants.dart';
import '../../common_component/LeftSideBar.dart';
import 'common/data_page_ieltls.dart';
import 'component/i_box_component.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class IeltsPage extends StatefulWidget {
  IeltsPage({Key? key}) : super(key: key);

  @override
  State<IeltsPage> createState() => _IeltsPage();
}

class _IeltsPage extends State<IeltsPage> {
  List nameIelts = [
    "Listen",
    "Reading",
  ];
  List<Color> colorIconIelts = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
  ];

  List<Icon> iconIests = [
    Icon(Icons.spatial_audio, color: Colors.white, size: 25),
    Icon(Icons.menu_book, color: Colors.white, size: 25),
  ];

  final NavigationService _navigationService = locator<NavigationService>();

  void nextPage(String name) {
    switch (name) {
      case "Listen":
        _navigationService.navigateTo(routes.I_Listening, arguments: {});
        break;
      case "Reading":
        _navigationService.navigateTo(routes.I_Reading, arguments: {});
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Ielts Test'.tr,
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: buildIeltsPage(context),
    );
  }

  Widget buildIeltsPage(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  itemCount: nameIelts.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        nextPage(nameIelts[index]);
                      },

                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: colorIconIelts[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: iconIests[index],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            nameIelts[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bài học'.tr,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    learning_process.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: I_Widget(
                        widthBox: 300,
                        learning_process: learning_process[index],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gợi ý'.tr,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          IBoxCommmon(
                            imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/icon%2Flanguage.png?alt=media&token=0d4f30cd-92d0-48ff-904e-5e75a1ec66bd',
                            title: 'Idioms & Phrasal',
                            backgroundColor: Color(0xFFEDE7F6),
                            width: 250,
                                onTap: () {},
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          IBoxCommmon(
                            imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/icon%2Flearning.png?alt=media&token=28ef99c5-a0cc-404b-97d0-f5d47aafa2af',
                            title: 'Ielts Idea',
                            backgroundColor: Color(0xFFFFFDE7),
                            width: 132,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          IBoxCommmon(
                            imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/icon%2Fupdated.png?alt=media&token=c08eb054-7478-46b6-9cfd-916f7c207def',
                            title: 'Daily Update',
                            backgroundColor: Color(0xFFE8F5E9),
                            width: 200,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          IBoxCommmon(
                            imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/icon%2Fbook.png?alt=media&token=7a82d90b-7d83-4fe7-a5af-1030bba12b36',
                            title: 'Từ vựng Ielts',
                            backgroundColor: Color(0xFFFBE9E7),
                            width: 182,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
