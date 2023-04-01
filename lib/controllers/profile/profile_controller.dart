import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_front_end/pages/profile/editProfilePage/edit_profile_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../common/common_function.dart';
import '../common/storage_method.dart';

class ProfileController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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

  Future<void> changeAvatar() async {
    Uint8List images = await pickImage(ImageSource.gallery);

    String avatarUrl = await StorageMethods()
        .uploadImageToStorage('profileImages', images, false);
  }

  Future<void> showUserNameDialogAlert(BuildContext context, String name) {
    fullnameController.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Edit fullname",
              style: Theme.of(context).textTheme.displaySmall,
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
                  child: const Text(
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
                            builder: (context) => const EditProfilePage()));
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: greenColor),
                  ))
            ],
          );
        });
  }

  Future<void> showPhoneNumberDialogAlert(
      BuildContext context, String phoneNumber) {
    phoneNumberController.text = phoneNumber;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Edit phone number",
              style: Theme.of(context).textTheme.displaySmall,
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
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: redColor),
                  )),
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      'phoneNumber': phoneNumberController.text.toString()
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
                  },
                  child: const Text(
                    "Edit",
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
