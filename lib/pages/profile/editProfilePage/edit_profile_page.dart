import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mobile_front_end/controllers/profile/profile_controller.dart';
import 'package:mobile_front_end/pages/common_component/LeftSideBar.dart';
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
  int level = 0;
  int score = 0;

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
      level = data != null && data is Map<String, dynamic> ? data['level'] : 0;
      score = data != null && data is Map<String, dynamic> ? data['score'] : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();

    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
          drawer: LeftSideBar(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text('profile'.tr,style: TextStyle(fontSize: 18)),
          ),
          resizeToAvoidBottomInset: false,
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
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/level.jpeg",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'your_level'.tr,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              "${level}",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: greenColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/rank.jpeg",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Text(
                              "${score} ${'points'.tr}",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              'rank'.tr,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  // fontFamily: GoogleFonts.poppins().toString(),
                                  color: redColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      ProfileController()
                          .showUserNameDialogAlert(context, fullname);
                    },
                    child: EditProfileItem(
                      icon: const Icon(
                        Icons.person,
                        size: 25,
                        color: primaryColor,
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
                      size: 25,
                      color: primaryColor,
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
                        size: 25,
                        color: primaryColor,
                      ),
                      title: 'phone_number'.tr,
                      value: phoneNumber,
                      isEdited: true,
                    ),
                  ),
                ],
              ),
            ),
          )
    );

  }
}
