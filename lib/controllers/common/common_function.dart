
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? pickerFile = await imagePicker.pickImage(source: source);

  if (pickerFile != null) {
    return await pickerFile.readAsBytes();
    // web
    // if (kIsWeb) {
    //   return await pickerFile.readAsBytes();
    // } else {
    //   // mobile
    //   return File(pickerFile.path);
    // }
  } else {
    print("No image seleted.");
  }
}

String capitalize(String value) {
  var result = value[0].toUpperCase();
  bool cap = true;
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " " && cap == true) {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
      cap = false;
    }
  }
  return result;
}


Future<double> getVolume() async {
  double volume;
  DocumentSnapshot snap = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();

  volume = (snap.data() as Map<String, dynamic>)["volume"];
  return volume;
}
//
// FlutterTts flutterTts = FlutterTts();
//
// void speakNormal(String text) async {
//   double volume = await getVolume();
//   print('volume: ');
//   print(volume);
//   await flutterTts.setLanguage("en-US");
//   await flutterTts.setVolume(0.8);
//   await flutterTts.setSpeechRate(0.5);
//   await flutterTts.setPitch(1);
//   await flutterTts.speak(text);
// }
//
// void speakLow(String text) async {
//   double volume = await getVolume();
//   await flutterTts.setLanguage("en-US");
//   await flutterTts.setVolume(volume);
//   await flutterTts.setSpeechRate(0.15);
//   await flutterTts.setPitch(1);
//   await flutterTts.speak(text);
// }