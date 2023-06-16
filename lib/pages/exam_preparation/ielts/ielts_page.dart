import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/exam_preparation/ielts/component/i_widget.dart';

import '../../../utils/constants.dart';
import '../../common_component/LeftSideBar.dart';
import 'common/data_page_ieltls.dart';
import 'i_recommen.dart';

class IeltsPage extends StatefulWidget {
  IeltsPage({Key? key}) : super(key: key);

  @override
  State<IeltsPage> createState() => _IeltsPage();
}

class _IeltsPage extends State<IeltsPage> {
  List nameIelts = [
    "Listen",
    "Reading",
    "Specking",
    "Writing",
  ];
  List<Color> colorIconIelts = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
  ];

  List<Icon> iconIests = [
    Icon(Icons.spatial_audio, color: Colors.white, size: 25),
    Icon(Icons.menu_book, color: Colors.white, size: 25),
    Icon(Icons.multitrack_audio, color: Colors.white, size: 25),
    Icon(Icons.wrap_text, color: Colors.white, size: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Ielts Page'.tr,
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
                      // onTap: () {
                      //   nextPage(namesIcon[index]);
                      // },

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
                      'Đang học'.tr,
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
                        learning_process: learning_process[index] ?? '',
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 250,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              child: Text("I dome"),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Container(
                                width: 110,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(5)),
                              child: Text('oki'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Container(
                                width: 260,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 380,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),)),
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
