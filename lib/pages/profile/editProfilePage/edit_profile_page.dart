import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/profile/profilePage/profile_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _statusShowPass = false;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _fullnameController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPassController = new TextEditingController();

  // check validate login form
  var _fullnameError = 'Invalid name.';
  var _emailError = 'Invalid email.';
  var _phoneNumberError = 'Invalid phone number.';
  var _passwordError =
      'Invalid password. Password must have 8 characters at least.';

  var _invalidEmail = false;
  var _invalidFullname = false;
  var _invalidPhoneNumber = false;
  var _invalidPassword = false;

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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage("images/avatar.jpeg"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blueAccent.withOpacity(0.1),
                          ),
                          child: const Icon(
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
                  // Form(
                  //   child: Column(
                  //     children: [
                  //       TextField(
                  //         controller: _fullnameController,
                  //         style: TextStyle(fontSize: 18, color: Colors.black),
                  //         decoration: InputDecoration(
                  //           labelText: "FULL NAME",
                  //           errorText: _invalidFullname ? _fullnameError : null,
                  //           labelStyle: TextStyle(
                  //             color: Color(0xff888888),
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       TextField(
                  //         controller: _emailController,
                  //         style: TextStyle(fontSize: 18, color: Colors.black),
                  //         decoration: InputDecoration(
                  //           labelText: "EMAIL",
                  //           errorText: _invalidEmail ? _emailError : null,
                  //           labelStyle: TextStyle(
                  //             color: Color(0xff888888),
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       TextField(
                  //         controller: _phoneNumberController,
                  //         style: TextStyle(fontSize: 18, color: Colors.black),
                  //         decoration: InputDecoration(
                  //           labelText: "PHONE NUMBER",
                  //           errorText:
                  //               _invalidPhoneNumber ? _phoneNumberError : null,
                  //           labelStyle: TextStyle(
                  //             color: Color(0xff888888),
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         height: 20,
                  //       ),
                  //       SizedBox(
                  //         width: double.infinity,
                  //         child: ElevatedButton(
                  //           onPressed: () {},
                  //           style: ElevatedButton.styleFrom(
                  //               backgroundColor: Colors.blue,
                  //               side: BorderSide.none,
                  //               shape: const StadiumBorder()),
                  //           child: const Text(
                  //             "Edit profile",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _fullnameController,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 36,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                labelText: "Full name",
                                hintText: "Full name",
                                errorText:
                                    _invalidFullname ? _fullnameError : null,
                                labelStyle: TextStyle(
                                  color: Color(0xff888888),
                                  fontSize: 20,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _emailController,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 36,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                labelText: "E-mail",
                                hintText: "E-mail",
                                errorText: _invalidEmail ? _emailError : null,
                                labelStyle: TextStyle(
                                  color: Color(0xff888888),
                                  fontSize: 20,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _phoneNumberController,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  size: 36,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                labelText: "Phone number",
                                hintText: "Phone number",
                                errorText: _invalidPhoneNumber
                                    ? _phoneNumberError
                                    : null,
                                labelStyle: TextStyle(
                                  color: Color(0xff888888),
                                  fontSize: 20,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Edit profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),

                                style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                foregroundColor: whiteColor,
                                backgroundColor: lightPrimaryColor,
                                side: BorderSide(color: lightPrimaryColor),
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100))
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
