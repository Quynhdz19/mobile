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

String formatTime(int time) {
  int sec = time % 60;
  int min = (time / 60).floor();
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return "$minute : $second";
}
