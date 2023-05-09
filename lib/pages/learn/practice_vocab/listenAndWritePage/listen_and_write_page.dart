import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/practice_vocab/listenAndWritePage/components/input_bar.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';
import 'package:mobile_front_end/widgets/sound_bar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ListenAndWritePage extends StatelessWidget {
  ListenAndWritePage({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5,10,0,0),
                child: IconButton(
                  onPressed: () {
                    _navigationService.navigateTo(routes.LearningPage, arguments: {});
                  },
                  padding: EdgeInsets.only(top: 15),
                  icon: const Icon(Icons.close,),
                  color: primaryColor,
                ),
              ),
            ],
          ),

          Text(
            "Listen and write",
            style: TextStyle(color: Colors.black87, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const InputBar(),
        ],
      ),
    );
  }
}
