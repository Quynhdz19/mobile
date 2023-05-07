import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mobile_front_end/controllers/profile/profile_controller.dart';
import 'package:mobile_front_end/pages/profile/components/edit_profile_item.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/common/common_function.dart';
import '../../../controllers/common/storage_method.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  Uint8List? image;

  // check validate login form
  final _fullnameError = 'Invalid name.';
  final _emailError = 'Invalid email.';
  final _phoneNumberError = 'Invalid phone number.';

  final _invalidEmail = false;
  final _invalidFullname = false;
  final _invalidPhoneNumber = false;

  String fullname = "";
  String email = "";
  String phoneNumber = "";

  void changeAvatar() async {
    Uint8List images = await pickImage(ImageSource.gallery);

    String avatarUrl = await StorageMethods()
        .uploadImageToStorage('profileImages', images, false);
    setState(() {
      image = images;
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'imageUrl': avatarUrl});
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EditProfilePage()));
  }

  @override
  void initState() {
    super.initState();
    getInfor();
  }

  void getInfor() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: prefs.getString('email')) // add your condition here
        .get();

    // get data from the first document in the snapshot
    final Object? data =
    snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : {};


    setState(() {
      fullname = data != null && data is Map<String, dynamic> ? data['fullname'] : 'Chào bạn!';
      email = prefs.getString('email')!;
      phoneNumber = data != null && data is Map<String, dynamic> ? data['phoneNumber'] : 'Chào bạn!';
    });
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();

    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ProfilePage()));
                _navigationService.goBack();
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            title: Text(
              'edit_profile'.tr,
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
                        child: image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(image!))
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/free-vector/cute-corgi-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4181.jpg?w=2000"),
                              ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -5,
                        child: IconButton(
                          onPressed: changeAvatar,
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 25,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      ProfileController()
                          .showUserNameDialogAlert(context, fullname);
                    },
                    child: EditProfileItem(
                      icon: const Icon(
                        Icons.person,
                        size: 30,
                        color: lightPrimaryColor,
                      ),
                      title: 'full_name'.tr,
                      value: fullname,
                      isEdited: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EditProfileItem(
                    icon: const Icon(
                      Icons.email,
                      size: 30,
                      color: lightPrimaryColor,
                    ),
                    title: 'email'.tr,
                    value: email,
                    isEdited: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      ProfileController()
                          .showPhoneNumberDialogAlert(context, phoneNumber);
                    },
                    child: EditProfileItem(
                      icon: const Icon(
                        Icons.phone,
                        size: 30,
                        color: lightPrimaryColor,
                      ),
                      title: 'phone_number'.tr,
                      value: phoneNumber,
                      isEdited: true,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
