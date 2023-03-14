import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/homepage/home_page.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/data/topic_data.dart';
import 'package:mobile_front_end/pages/home/newWordPage/components/word_box.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';

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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.close),
                  color: primaryColor,
                ),
              ),
            ],
          ),
          ProcessBar(rate: 0.5),
          SizedBox(
            height: 50,
          ),
          WordBox(topic: topics[0]),
          SizedBox(
            height: 50,
          ),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 100))),
          ),
          SizedBox(
            height: 50,
          ),
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
