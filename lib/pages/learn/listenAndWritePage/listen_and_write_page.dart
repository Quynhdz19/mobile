import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/listenAndWritePage/components/input_bar.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';
import 'package:mobile_front_end/widgets/sound_bar.dart';

class ListenAndWritePage extends StatelessWidget {
  const ListenAndWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                  color: primaryColor,
                ),
              ),
            ],
          ),
          ProcessBar(rate: 0.2),
          SizedBox(
            height: 40,
          ),
          Text(
            "Listen and write",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 40,
          ),
          SoundBar(iconWidth: 70, space: 0,),
          SizedBox(
            height: 60,
          ),
          InputBar(),
        ],
      ),
    );
  }
}
