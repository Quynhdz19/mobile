import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> getData(collection) async {
  try {
    QuerySnapshot querySnapshot = await _firestore.collection('$collection').get();

    if (querySnapshot.docs.isNotEmpty) {
      final users = querySnapshot.docs.map((snapshot) => snapshot.data()).toList();
      print(users);
    } else {
      print('No data available in the "users" collection.');
    }
  } catch (e) {
    print('Error while getting users: $e');
  }
}