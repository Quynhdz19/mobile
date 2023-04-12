import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/wordPage/components/scramble_word_body.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ScrambleWordPage extends StatefulWidget {
  const ScrambleWordPage({Key? key}) : super(key: key);

  @override
  State<ScrambleWordPage> createState() => _ScrambleWordPageState();
}

class _ScrambleWordPageState extends State<ScrambleWordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: scrambleLightColor,
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      color: scrambleLightColor,
                      child: ScrambleWordBody(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.lightbulb,
                            color: whiteColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Hint",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        foregroundColor: whiteColor,
                        backgroundColor: scrambleGreenColor,
                        side: BorderSide(color: scrambleGreenColor),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.repeat,
                            color: whiteColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Reload",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        foregroundColor: scrambleGreenColor,
                        backgroundColor: scrambleGreenColor,
                        side: BorderSide(color: scrambleGreenColor),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ]

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
