import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/forgot_password_page.dart';
import 'package:mobile_front_end/auth/login.dart';
import 'package:mobile_front_end/controllers/authentication/auth_method.dart';

import '../utils/toast/showToast.dart';
import 'forgot_password_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _statusShowPass = false;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  // check validate login form

  var _fullnameError = 'Tên không hợp lệ';
  var _emailError = 'Xin vui lòng kiểm tra lại Email';
  var _passwordError = 'Mật khẩu không hợp lệ ';
  var _phoneNumberError = 'Số điện thoại không hợp lệ';
  var _confirmPasswordError = 'Mật khẩu nhập lại không khớp';

  bool _invalidFullname = false;
  bool _invalidEmail = false;
  bool _invalidPassword = false;
  bool _invalidPhoneNumber = false;
  bool _invalidConfirmPassword = false;

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                    width: 80,
                    height: 80,
                    // padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.withOpacity(0.7), width: 1),
                  ),
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/images/logo_img.png"),
                    ),),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  )),
              //Đăng Nhập
              Form(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _fullnameController,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 36,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            labelText: "Fullname",
                            hintText: "Fullname",
                            errorText: _invalidFullname ? _fullnameError : null,
                            labelStyle: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 20,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phoneNumberController,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.call,
                              size: 36,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            labelText: "Phone number",
                            hintText: "Phone number",
                            errorText:
                                _invalidPhoneNumber ? _phoneNumberError : null,
                            labelStyle: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 20,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _confirmPassController,
                        obscureText: !_statusShowPass,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            labelText: "Confirm password",
                            hintText: "Confirm password",
                            errorText: _invalidConfirmPassword ? _confirmPasswordError : null,
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
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: signUpFunction,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                        onTap: toForgotPassword,
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
              // const Padding(
              //   padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
              // )
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
  void signUpFunction() async {
    bool invalidFullname;
    bool invalidEmail;
    bool invalidPassword;
    bool invalidPhoneNumber;
    bool invalidConfirmPassword;
    String res = '';
    if (_fullnameController.text.length < 3) {
      invalidFullname = true;
    } else {
      invalidFullname = false;
    }

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

    if (_phoneNumberController.text.length == 10 || _phoneNumberController.text.length == 11) {
      invalidPhoneNumber = false;
    }else {
      invalidPhoneNumber = true;
    }

    if (_confirmPassController.text == _passwordController.text) {
      invalidConfirmPassword = false;
    } else {
      invalidConfirmPassword = true;
    }

    if (!invalidFullname && !invalidEmail && !invalidPassword && !invalidPhoneNumber && !invalidConfirmPassword) {
      res = await AuthMethod().signUpFunc(
          email: _emailController.text,
          fullname: _fullnameController.text,
          phoneNumber: _phoneNumberController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPassController.text);
    }
    setState(() {
      _invalidFullname = invalidFullname;
      _invalidEmail = invalidEmail;
      _invalidPassword = invalidPassword;
      _invalidPhoneNumber = invalidPhoneNumber;
      _invalidConfirmPassword = invalidConfirmPassword;
      if (res == "success") {
        showSuccessToast(context, "Đăng ký thành công !");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage())
        );
      } else {
        showFailureToast(
            context, "Đăng ký thất bại ! vui lòng kiểm tra lại thông tin");

      }
    });
  }

  void rollBackLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }


  void toForgotPassword() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ForgotPasswordPage()));
  }
}
