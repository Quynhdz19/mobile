import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/games/scrambleWordGame/wordPage/components/scramble_word_header.dart';
import 'package:mobile_front_end/utils/constants.dart';

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
            ScrambleWordHeader(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2),
                  child: Image(
                    image: AssetImage("assets/images/champion.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Word Question",
                style: TextStyle(
                  color: scrambleGreenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 25, 10, 30),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(5, (index) => index).map((puzzle) {
                      return InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: scrambleBoxColor,
                            color: Color.fromRGBO(253, 160, 145, 1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 207, 187, 0.8),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: constraints.biggest.width / 7 - 6,
                          height: constraints.biggest.width / 7 - 6,
                          margin: EdgeInsets.all(3),
                          child: Text(
                            "A",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              alignment: Alignment.center,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 6,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        decoration: BoxDecoration(
                          color: scrambleBoxColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "A",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
