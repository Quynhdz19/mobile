import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class SoundBar extends StatelessWidget {
  const SoundBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: lightBackgroundColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("icons/normal_sound_icon.png"),
              fit: BoxFit.scaleDown,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(1, 3),
              )
            ],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: lightBackgroundColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("icons/slow_sound_icon.png"),
              fit: BoxFit.scaleDown,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(1, 3),
              )
            ],
          ),
        ),
      ],
    );
  }
}
