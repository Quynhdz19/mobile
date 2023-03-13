import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/color.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';
import 'package:mobile_front_end/widgets/word_box.dart';

class NewWordPage extends StatelessWidget {
  const NewWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 35,
                        decoration: BoxDecoration(
                          color: lightBackgroundColor,
                          border: Border.all(color: Colors.black26, width: 3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          children: [
                            LayoutBuilder(
                              builder: (context, constraints) => Container(
                                width: constraints.maxWidth * 0.5,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          SizedBox(height: 50,),
          WordBox(topic: topics[0]),
          SizedBox(height: 50,),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),

                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: whiteColor,
                    backgroundColor: lightPrimaryColor,
                    side: BorderSide(color: lightPrimaryColor),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100))
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              style: Theme.of(context).textButtonTheme.style,
            ),
          ),
        ],
      ),
    );
  }

}
