
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Object?>> getAllDataInCollection(String collectionName) async {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();

  final List<Object?> allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  print(allData);
  return allData;
}