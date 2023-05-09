
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tts/flutter_tts.dart';

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

  void speakLow(String text) async {
    double volume = await getVolume();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(0.15);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

