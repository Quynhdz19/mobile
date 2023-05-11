import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../../controllers/common/sound_function.dart';
import '../../../../../services/locator.dart';
import '../../../../../services/navigation_service.dart';
import '../../../../../widgets/sound_bar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class PractiveWord extends StatelessWidget {
  PractiveWord({Key? key, this.words, required this.index,}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Confirm",
                            style:
                            TextStyle(color: primaryColor, fontSize: 20),
                          ),
                          content: Text(
                              "Do you want to quit learn vocabualary?",
                              style:
                              TextStyle(color: greyColor, fontSize: 17)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                  _navigationService.navigateTo(routes.LearningPage, arguments: {} );
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: greenColor, fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "No",
                                style:
                                TextStyle(color: redColor, fontSize: 18),
                              ),
                            ),
                          ],
                        ));
                  },
                  padding: EdgeInsets.only(top: 15),
                  icon: const Icon(
                    Icons.close,
                  ),
                  color: primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                "Confirm",
                                style:
                                    TextStyle(color: primaryColor, fontSize: 20),
                              ),
                              content: Text(
                                  "Do you want to quit learn vocabualary?",
                                  style:
                                      TextStyle(color: greyColor, fontSize: 17)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: greenColor, fontSize: 18),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "No",
                                    style:
                                        TextStyle(color: redColor, fontSize: 18),
                                  ),
                                ),
                              ],
                            ));
                  },
                  padding: EdgeInsets.only(top: 15),
                  icon: const Icon(Icons.lightbulb_outline),
                  color: primaryColor,
                ),
              ),
            ],
          ),
          SoundBar(iconWidth: 70, space: 0, word: words[0]["word_list"][i]["vocab"],),
          Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lightBackgroundColor,
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      words[0]["word_list"][i]["word_img_url"],
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    words[0]["word_list"][i]["type"],
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
