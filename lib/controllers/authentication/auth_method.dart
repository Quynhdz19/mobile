
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_front_end/models/user.dart' as models;

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // sign up function
  Future<String> signUpFunc({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullname,
    required String phoneNumber,
    // Uint8List imageUrl="https://img.freepik.com/free-vector/cute-corgi-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4181.jpg?w=2000",
    // String avatar=''
  }) async {
    String res = "Some errors occured.";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          confirmPassword.isNotEmpty ||
          fullname.isNotEmpty ||
          phoneNumber.isNotEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(credential.user!.uid);


        String imageUrl =
            "https://img.freepik.com/free-vector/cute-corgi-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4181.jpg?w=2000";

        // add user to db
        models.User user = models.User(
            fullname: fullname,
            uid: credential.user!.uid,
            email: email,
            phoneNumber: phoneNumber,
            imageUrl: imageUrl,
            score: 0,
            level: 0,
        );

        await firestore.collection('users').doc(credential.user!.uid).set({
          "fullname": fullname,
          "uid": credential.user!.uid,
          "email": email,
          "phoneNumber": phoneNumber,
          "imageUrl": imageUrl,
          "score": 0,
          "level": 0,
        });
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (err.code == 'weak-password') {
        res = 'Password should be at least 6 characters.';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signInFunc(
      {required String email, required String password}) async {
    String res = "Some errors occured.";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields.";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
