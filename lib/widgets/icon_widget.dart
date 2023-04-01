import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key, required this.iconWidth, required this.iconUrl}) : super(key: key);

  final double iconWidth;
  final String iconUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: iconWidth,
      height: iconWidth,
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(iconUrl),
          fit: BoxFit.scaleDown,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.4),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(1, 3),
          )
        ],
      ),
    );
  }
}
