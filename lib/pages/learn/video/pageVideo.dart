
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/controllers/common/clear_script.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/constants.dart';
import '../../home/homePage/components/search_bar.dart';
import 'components/tabar.dart';
import 'components/video_box.dart';
import 'components/video_container.dart';
import 'package:mobile_front_end/utils/data/video_data.dart';

class PageVideo extends StatefulWidget {
  PageVideo({Key? key}) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PageVideo> {

  List videosData = [];
  List videosListFuture = [];
  void getVideos() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('video').get();
    final List<QueryDocumentSnapshot> videos = snapshot.docs;

    videos.forEach((category) {
      Object? data = category.data();
      videosListFuture.add(data);
    });
    setState(() {
    });
  }

  final TextEditingController _searchKeyWords = TextEditingController();
  List listVideos = [];
  void filterData() {
    if (_searchKeyWords.text != "") {
      videosData = videosListFuture
          .where((category) => category['name']
          .toLowerCase()
          .contains(_searchKeyWords.text.toLowerCase()))
          .toList();
    } else {
      videosData = videosListFuture; // assign the original list

    }

  }

  @override
  void initState() {
    super.initState();
    getVideos();
    filterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Videos page'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              color: lightBackgroundColor,
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _searchKeyWords,
                              onChanged: (String text) {},
                              style: Theme.of(context).textTheme.bodyLarge,
                              decoration: InputDecoration(
                                hintText: 'search_here'.tr,
                                contentPadding:
                                EdgeInsets.fromLTRB(20.0, 13.0, 22.0, 13.0),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: primaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      filterData();
                                    });

                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ...List.generate(
                  videosData.length,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: VideoBoxContainer(
                      videos: videosData[index],
                    ),
                  ),
                ),
                ],
              ),
      )
    );
  }
}
