import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ProfileController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController fullnameController = new TextEditingController();

  DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child("users");
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
                    databaseReference.child("123").update({
                      'fullname': fullnameController.text.toString()
                    }).then((value) {
                      fullnameController.clear();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(color: greenColor),
                  ))
            ],
          );
        });
  }
}
