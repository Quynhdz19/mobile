import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mobile_front_end/controllers/profile/profile_controller.dart';
import 'package:mobile_front_end/pages/profile/components/edit_profile_item.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../controllers/common/common_function.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _fullnameController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  Uint8List? image;

  // check validate login form
  var _fullnameError = 'Invalid name.';
  var _emailError = 'Invalid email.';
  var _phoneNumberError = 'Invalid phone number.';

  var _invalidEmail = false;
  var _invalidFullname = false;
  var _invalidPhoneNumber = false;

  void changeAvatar() async {
    Uint8List _images = await pickImage(ImageSource.gallery);
    setState(() {
      image = _images;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            title: Text(
              'Edit profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(isDarkMode
                      ? Icons.sunny
                      : Icons.nightlight_round_outlined))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child:
                            // image != null
                            //     ? CircleAvatar(
                            //         radius: 64,
                            //         backgroundImage: MemoryImage(image!),
                            //       )
                            //     : const CircleAvatar(
                            //         radius: 64,
                            //         backgroundImage:
                            //             AssetImage("assets/images/avatar.jpeg"),
                            //       )

                            ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: image != null
                              ? (kIsWeb)
                                  ? Image.memory(image!)
                                  : Image.file(File("zz"))
                              : Image(
                                  image: AssetImage("assets/images/avatar.jpeg"),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: changeAvatar,
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 25,
                            color: Colors.blueAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      ProfileController().showUserNameDialogAlert(
                          context, _fullnameController.text);
                    },
                    child: EditProfileItem(
                        icon: Icon(
                          Icons.person,
                          size: 30,
                          color: lightPrimaryColor,
                        ),
                        title: "Full name",
                        value: "Bao An"),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      ProfileController().showUserNameDialogAlert(
                          context, _fullnameController.text);
                    },
                    child: EditProfileItem(
                        icon: Icon(
                          Icons.email,
                          size: 30,
                          color: lightPrimaryColor,
                        ),
                        title: "Email",
                        value: "a@gmail.com"),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      ProfileController().showUserNameDialogAlert(
                          context, _fullnameController.text);
                    },
                    child: EditProfileItem(
                        icon: Icon(
                          Icons.phone,
                          size: 30,
                          color: lightPrimaryColor,
                        ),
                        title: "Phone number",
                        value: "123456789"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
