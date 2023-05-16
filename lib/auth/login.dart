import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/forgot_password_page.dart';
import 'package:mobile_front_end/auth/register.dart';
import 'package:mobile_front_end/controllers/authentication/auth_method.dart';
import 'package:mobile_front_end/pages/main_page.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/utils/toast/showToast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/function/service_firebase.dart';
import '../services/locator.dart';
import '../services/navigation_service.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  bool _statusShowPass = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // check validate login form
  final _emailError = 'Xin vui lòng kiểm tra lại email';
  final _passwordError = 'Xin vui lòng kiểm tra lại password';
  bool _invalidEmail = false;
  bool _invalidPassword = false;

  Future<void> saveEmailUsername(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false, // bo loi pixel tren man hinh
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 80,
                  height: 80,
                  // padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.withOpacity(0.7), width: 1),
                   ),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("assets/images/logo_img.png"),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  )),

              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _emailController,
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
                            errorText: _invalidEmail ? _emailError : null,
                            labelStyle: const TextStyle(
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
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: !_statusShowPass,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            labelText: "Password",
                            hintText: "Password",
                            errorText: _invalidPassword ? _passwordError : null,
                            labelStyle: const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 20,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: IconButton(
                              icon: Icon(_statusShowPass
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: onToggelShowPass,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              //Đăng Nhập
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onSignIn,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: registerAccount,
                        child: const Text(
                          'You don\'t have account ?',
                          style:
                          TextStyle(fontSize: 15, color: Color(0xff888888)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // print(Text("Click on forgot password"));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPasswordPage()));
                        },
                        child: const Text(
                          'Forgot password ?',
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
              )
            ],
          ),
        ),
      ),
    );
  }

  // show passs
  void onToggelShowPass() {
    setState(() {
      _statusShowPass = !_statusShowPass;
    });
  }

  //login
  void onSignIn() async {
    bool invalidEmail;
    bool invalidPassword;
    String res = '';

    if (_emailController.text.length < 3 && !_emailController.text.contains("@")) {
      invalidEmail = true;
    } else {
      invalidEmail = false;
    }

    if (_passwordController.text.length < 5) {
      invalidPassword = true;
    } else {
      invalidPassword = false;
    }

    if (!invalidEmail && !invalidPassword) {
      res = await AuthMethod().signInFunc(
          email: _emailController.text, password: _passwordController.text);
    }

    setState(() {
      _invalidEmail = invalidEmail;
      _invalidPassword = invalidPassword;
      if (res == "success") {
        saveEmailUsername(_emailController.text);
        showSuccessToast(context, "Login successfully!");
        _navigationService.navigateTo(routes.MainPage, arguments: {});
      } else {
        _invalidEmail = true;
        _invalidPassword = true;
        showFailureToast(
            context, "Login failed. Please check your information.");

      }
    });
  }

  // chuyển sang màn đăng ký
  void registerAccount() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Register()));
  }

  // chuyển sang màn quên mật khẩu
  void forgotPassword() {}
}