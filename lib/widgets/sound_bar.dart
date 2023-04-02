import 'package:flutter/material.dart';
import 'package:mobile_front_end/widgets/icon_widget.dart';

class SoundBar extends StatelessWidget {
  const SoundBar({Key? key, required this.iconWidth, required this.space}) : super(key: key);

  final double iconWidth;
  final double space;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconWidget(iconWidth: iconWidth, iconUrl: "assets/icons/normal_sound_icon.png",),
          SizedBox(
            width: space,
          ),
          IconWidget(iconWidth: iconWidth, iconUrl: "assets/icons/slow_sound_icon.png",),
        ],
      ),
    );
  }
}
