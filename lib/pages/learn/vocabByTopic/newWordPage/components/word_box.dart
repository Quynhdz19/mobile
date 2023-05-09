import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/widgets/sound_bar.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class WordBox extends StatelessWidget {
  WordBox({Key? key, required this.topic, required  this.index}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  final topic;
  final index;
  @override
  Widget build(BuildContext context) {
    int i = index as int;
    if (i < 0) {
      i = 0;
    }
    return Stack(children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 505,
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
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          topic[0]["word_list"][i]["word_img_url"],
                          width: 300,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          topic[0]["word_list"][i]["vocab"],
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          topic[0]["word_list"][i]["type"],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        topic[0]["word_list"][i]["pronoun"],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        topic[0]["word_list"][i]["meaning"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 15,
        left: 70,
        child: SoundBar(iconWidth: 50, space: 40, word: topic[0]["word_list"][i]["vocab"]),
      )
    ]);
  }
}
