import 'package:flutter/material.dart';

class LoseContent extends StatelessWidget {
  const LoseContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/cry.png",
            width: 200,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
