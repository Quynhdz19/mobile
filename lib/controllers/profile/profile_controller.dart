import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ProfileController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController fullnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child("users");
  FirebaseStorage storage = FirebaseStorage.instance;

// sign up function
  Future<String> editProfileFunction(
      {required String email,
      required String fullname,
      required String phoneNumber,
      required Uint8List image}) async {
    String res = "Some errors occured.";
    try {} on FirebaseAuthException catch (err) {
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

  Future<void> showUserNameDialogAlert(BuildContext context, String name) {
    fullnameController.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Update fullname",
              style: Theme.of(context).textTheme.headline3,
            )),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: fullnameController,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: redColor),
                  )),
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update(
                            {'fullname': fullnameController.text.toString()});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()));
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: greenColor),
                  ))
            ],
          );
        });
  }

  Future<void> showEmailDialogAlert(BuildContext context, String email) {
    emailController.text = email;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  "Update email",
                  style: Theme.of(context).textTheme.headline3,
                )),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: redColor),
                  )),
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update(
                        {'email': emailController.text.toString()});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()));
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: greenColor),
                  ))
            ],
          );
        });
  }

  Future<void> showPhoneNumberDialogAlert(BuildContext context, String phoneNumber) {
    phoneNumberController.text = phoneNumber;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  "Update phone number",
                  style: Theme.of(context).textTheme.headline3,
                )),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneNumberController,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: redColor),
                  )),
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update(
                        {'phoneNumber': phoneNumberController.text.toString()});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()));
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: greenColor),
                  ))
            ],
          );
        });
  }

  Future<String> getFullname() async {
    String res = "";
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    res = (snap.data() as Map<String, dynamic>)["fullname"];
    print(res);
    return res;
  }
}
