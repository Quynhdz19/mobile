import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/forgot_password_page.dart';
import 'package:mobile_front_end/auth/register.dart';
import 'package:mobile_front_end/controllers/authentication/auth_method.dart';
import 'package:mobile_front_end/pages/main_page.dart';
import 'package:mobile_front_end/utils/toast/showToast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool _statusShowPass = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // check validate login form
  final _emailError = 'Email không hợp lệ';
  final _passwordError = 'Mật khẩu không hợp lệ ';
  final _invalidEmail = false;
  final _invalidPassword = false;

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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  // padding: EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("assets/images/mobile_logo.png"),

                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Welcome back!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  )),

              // email
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              //   child: TextField(
              //     controller: _emailController,
              //     style: TextStyle(fontSize: 18, color: Colors.black),
              //     decoration: InputDecoration(
              //       labelText: "EMAIL",
              //       errorText: _invalidEmail ? _emailError : null,
              //       labelStyle: TextStyle(
              //         color: Color(0xff888888),
              //         fontSize: 20,
              //       ),
              //     ),
              //   ),
              // ),
              //
              // //password
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              //   child: Stack(
              //     alignment: AlignmentDirectional.centerEnd,
              //     children: <Widget>[
              //       TextField(
              //         controller: _passwordController,
              //         style: TextStyle(fontSize: 18, color: Colors.black),
              //         obscureText: !_statusShowPass,
              //         decoration: InputDecoration(
              //           labelText: "PASSWORD",
              //           errorText: _invalidPassword ? _passwordError : null,
              //           labelStyle: TextStyle(
              //             color: Color(0xff888888),
              //             fontSize: 20,
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //           onTap: onToggelShowPass,
              //           child: Icon(
              //             _statusShowPass
              //                 ? Icons.visibility
              //                 : Icons.visibility_off,
              //             size: 30,
              //             color: Colors.blue,
              //           )),
              //     ],
              //   ),
              // ),

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
    String res = await AuthMethod().signInFunc(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      showSuccessToast(context, "Sign in successfully !");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    } else {
      showFailureToast(context, "Sign in failed. Please try again.");
    }

    // setState(() {
    //   if (_emailController.text.length < 6 ||
    //       !_emailController.text.contains("@")) {
    //     _invalidEmail = true;
    //   } else {
    //     _invalidEmail = false;
    //   }
    //   if (_passwordController.text.length < 8) {
    //     _invalidPassword = true;
    //   } else {
    //     _invalidPassword = false;
    //   }

    // if (!_invalidEmail && !_invalidPassword) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => MainPage()));
    // }
  }

  // chuyển sang màn đăng ký
  void registerAccount() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Register()));
  }

  // chuyển sang màn quên mật khẩu
  void forgotPassword() {}
}
