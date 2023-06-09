import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/login.dart';
import 'package:mobile_front_end/controllers/authentication/auth_method.dart';

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

  var _fullnameError = '';
  var _emailError = 'Email không hợp lệ';
  var _passwordError = 'Mật khẩu không hợp lệ ';
  var _phoneNumberError = '';

  var _invalidFullname = false;
  var _invalidEmail = false;
  var _invalidPassword = false;
  var _invalidPhoneNumber = false;

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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                    child: const FlutterLogo()),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                        child: const Text(
                          'Fotgot password ?',
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
  void signUpFunction() async {
    print("click in dang ky");
    String res = await AuthMethod().signUpFunc(
        email: _emailController.text,
        fullname: _fullnameController.text,
        phoneNumber: _phoneNumberController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPassController.text);
    print(res);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    // setState(() {
    //   if (_emailController.text.length < 6 ||
    //       !_emailController.text.contains("@")) {
    //     _invalidEmail = true;
    //   } else {
    //     _invalidEmail = false;
    //   }
    //   if (_passwordController.text.length < 8 ||
    //       (_confirmPassController != _passwordController)) {
    //     _invalidPassword = true;
    //   } else {
    //     _invalidPassword = false;
    //   }
    //
    //   if (!_invalidEmail && !_invalidPassword) {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => LoginPage()));
    //   }
    // });
  }

  void rollBackLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
