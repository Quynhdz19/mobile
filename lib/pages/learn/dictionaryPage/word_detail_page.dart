import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/common/common_function.dart';

import '../../../services/locator.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/constants.dart';

class WordDetailPage extends StatelessWidget {
  WordDetailPage(
      {Key? key,
      required this.word,
      required this.type,
      required this.definition,
      required this.example,
      required this.image_url,
      required this.emoji})
      : super(key: key);

  final String word;
  final String type;
  final String definition;
  final String example;
  final String image_url;
  final String emoji;

  final NavigationService _navigationService = locator<NavigationService>();

  FlutterTts flutterTts = FlutterTts();

  Future<double> getVolume() async {
    double volume;
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    volume = (snap.data() as Map<String, dynamic>)["volume"];
    return volume;
  }

  void speakNormal(String text) async {
    double volume = await getVolume();
    print('volume: ');
    print(volume);
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _navigationService.goBack();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          capitalize(word),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1))
            ]),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey.withOpacity(0.1),
                  //       spreadRadius: 1,
                  //       blurRadius: 1,
                  //       offset: const Offset(1, 1))
                  // ]
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                          image:
                              DecorationImage(image: NetworkImage(image_url)),
                          borderRadius: BorderRadius.circular(20)),
                      // child: Image(image: NetworkImage(image_url))
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              capitalize(word),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            speakNormal(word);
                          },
                          icon: Icon(
                            Icons.volume_up,
                            color: Colors.white,
                          ),
                          color: Colors.lightBlueAccent,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Text(
              capitalize(type),
              style: GoogleFonts.poppins(
                  color: greenColor, fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              capitalize(definition),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            example == ""
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Example: ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Center(
                          child: Text(
                            capitalize(example),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal, fontSize: 14),
                          ),
                      )
                    ],
                  )
            // Text(
            //   emoji,
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
          ],
        ),
      ),
    );
  }
}
