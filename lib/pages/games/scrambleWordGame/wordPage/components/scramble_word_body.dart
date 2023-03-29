import 'package:flutter/material.dart';

class ScrambleWordBody extends StatefulWidget {
  const ScrambleWordBody({Key? key}) : super(key: key);

  @override
  State<ScrambleWordBody> createState() => _ScrambleWordBodyState();
}

class _ScrambleWordBodyState extends State<ScrambleWordBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/images/wordscramblecontent.png", width: 250),

          ],
        ),
      ),
    );
  }
}
