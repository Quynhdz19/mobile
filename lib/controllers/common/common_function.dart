
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
