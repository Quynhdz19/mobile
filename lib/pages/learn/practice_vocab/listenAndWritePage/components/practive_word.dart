import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../../controllers/common/sound_function.dart';
import '../../../../../services/locator.dart';
import '../../../../../services/navigation_service.dart';
import '../../../../../services/route_paths.dart';
import '../../../../../widgets/sound_bar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../learn_page.dart';

class PractiveWord extends StatelessWidget {
  PractiveWord({
    Key? key,
    this.words,
    required this.index,
  }) : super(key: key);

  final words;
  final index;
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    int i = index as int;
    if (i < 0) {
      i = 0;
    }
    if (i < words[0]["word_list"].length - 1) {
      speakNormal(words[0]["word_list"][i]["vocab"]);
      print(1);
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 8),
          decoration: BoxDecoration(
            // color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: isDarkMode ? darkBackgroundColor : lightBackgroundColor,
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(1, 3),
              ) // changes position of shadow
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              'confirm'.tr,
                              style:
                                  TextStyle(color: primaryColor, fontSize: 20),
                            ),
                            content: Text(
                                'confirm_exit'.tr,
                                style:
                                    TextStyle(color: greyColor, fontSize: 17)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'cancel'.tr,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                  _navigationService.navigateTo(
                                      routes.LearningPage,
                                      arguments: {});
                                },
                                child: Text(
                                  'exit'.tr,
                                  style:
                                      TextStyle(color: redColor, fontSize: 18),
                                ),
                              ),
                            ],
                          ));
                },
                // padding: EdgeInsets.only(top: 15),
                icon: const Icon(Icons.close, size: 28),
                color: primaryColor,
              ),
              Text('practice'.tr,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 1,
                  )),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                              'answer'.tr,
                              style:
                                  TextStyle(color: primaryColor, fontSize: 20),
                            ),
                            content: Container(
                              width: double.infinity,
                              height: 120,
                              child: Column(
                                children: [
                                  Text(words[0]["word_list"][i]["vocab"],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(words[0]["word_list"][i]["pronoun"],
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 17)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(words[0]["word_list"][i]["meaning"],
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 17)),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'done'.tr,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                              ),
                            ],
                          ));
                },
                // padding: EdgeInsets.only(top: 15),
                icon: const Icon(Icons.lightbulb_outlined, size: 28),
                color: Colors.green.shade300,
              ),
            ],
          ),
        ),
        // SizedBox(height: 20),
        // SoundBar(iconWidth: 60, space: 0, word: words[0]["word_list"][i]["vocab"],),
        // SizedBox(height:5),
        Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 150, 10, 30),
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDarkMode ? darkBackgroundColor : lightBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(1, 3),
                ) // changes position of shadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/learnbridge-3cfe6.appspot.com/o/topic%2Fhoi.png?alt=media&token=4a13d183-6cdc-40cb-b6b2-c0e06e582950'
                        ),
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    words[0]["word_list"][i]["type"],
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 100,
          left: 105,
          child: SoundBar(
            iconWidth: 60,
            space: 40,
            word: words[0]["word_list"][i]["vocab"],
          ),
        )
      ],
    );
  }
}
