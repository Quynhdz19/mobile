import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/auth/OTP_verification_page.dart';
import 'package:mobile_front_end/auth/register.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/toast/showToast.dart';

import 'login.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var emailError = 'Invalid email.';
    var invalidEmail = false;

    final NavigationService _navigationService = locator<NavigationService>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 30, 10, 5),
              child: IconButton(
                onPressed: () {
                  _navigationService.goBack();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            // decoration: BoxDecoration(
            //   color: lightBackgroundColor,
            // ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/forgot-password.png", height: 180,),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Forgot password",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Enter your email to receive a code to reset your password.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          size: 36,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        labelText: "E-mail",
                        hintText: "E-mail",
                        errorText: invalidEmail ? emailError : null,
                        labelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontSize: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: resetPassword,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side:
                                            const BorderSide(color: Colors.blue)))),
                        child: const Text(
                          'Reset password',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: rollBackLogin,
                            child: const Text(
                              'You had an account ?',
                              style:
                              TextStyle(fontSize: 15, color: Color(0xff888888)),
                            ),
                          ),
                          GestureDetector(
                            onTap: registerAccount,
                            child: const Text(
                              'You don\'t an account ?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showInfoToast(context, "Please check your mail to change password and sign in again!");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar("Error", '${e.toString()}');
      Navigator.of(context).pop();
    }
  }
  // chuyển sang màn đăng ký
  void registerAccount() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Register()));
  }

  void rollBackLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
