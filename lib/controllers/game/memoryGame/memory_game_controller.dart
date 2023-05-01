import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobile_front_end/models/games/memory_word.dart';

List<MemoryWord> sourceWords = [];

Future<String> populateSourceWords() async {
  final reference = FirebaseStorage.instance.ref().child("memoryGame/").getDownloadURL();
  // final allWords = await reference.listAll();
  //
  // print('reference');
  // print(reference);
  // print('all words');
  // print(allWords);
  //
  // // StorageReference storageReference =  FirebaseStorage.getInstance().getReference("gallery");
  //
  // reference.child("memoryGame/" +"airplane").getDownloadURL().addOnSuccessListener();
  //
  //
  // for (var item in allWords.items) {
  //   sourceWords.add(MemoryWord(
  //       text: item.name.substring(0, item.name.indexOf('.')),
  //       url: await item.getDownloadURL(),
  //       displayText: false));
  // }
  return reference;
}
