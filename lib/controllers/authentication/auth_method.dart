import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // sign up function
  Future<String> signUpFunc({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    String res = "Some errors occured.";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          confirmPassword.isNotEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(credential.user!.uid);
        // add user to db
        await firestore.collection('users').doc(credential.user!.uid).set({
          'uid': credential.user!.uid,
          'email': email,
        });

        // await firestore.c
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
