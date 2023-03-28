import 'package:flutter/material.dart';
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
        color: greenColor,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    color: primaryColor,
                    // child: WordBody(),
                  );
                },
              ),
            ),
            Container(
              width: 130,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                },
                child: Row(
                  children: [
                    Icon(Icons.repeat, color: primaryColor,),
                    SizedBox(width: 4,),
                    Text(
                      "Reload",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
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
                  backgroundColor: whiteColor,
                  side: BorderSide(color: lightPrimaryColor),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
