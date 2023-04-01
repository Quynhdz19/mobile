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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5,10,0,0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.close),
                  color: primaryColor,
                ),
              ),
              const ProcessBar(rate: 0.5),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          WordBox(topic: topics[0]),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: whiteColor,
                    backgroundColor: lightPrimaryColor,
                    side: const BorderSide(color: lightPrimaryColor),
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 100)),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: Theme.of(context).textButtonTheme.style,
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
