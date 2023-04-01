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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5,10,0,0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  color: primaryColor,
                ),
              ),
              const ProcessBar(rate: 0.2),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Listen and write",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 40,
          ),
          const SoundBar(iconWidth: 70, space: 0,),
          const SizedBox(
            height: 50,
          ),
          const InputBar(),
        ],
      ),
    );
  }
}
