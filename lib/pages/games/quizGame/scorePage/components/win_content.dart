import 'package:flutter/material.dart';

class WinContent extends StatelessWidget {
  WinContent({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/champion.png",
            width: 200,
          ),
          Image.asset(
            "assets/images/congratulation.png",
            width: 250,
          ),
        ],
      ),
    );
  }
}
