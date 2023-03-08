import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/register.dart';
import 'package:mobile_front_end/pages/main_page.dart';

import '../pages/home_page.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<LoginPage> {
  bool _statusShowPass = false;

  TextEditingController  _emailController = new TextEditingController();
  TextEditingController  _passwordController = new TextEditingController();

  // check validate login form
  var _emailError = 'Email không hợp lệ';
  var _passwordError = 'Mật khẩu không hợp lệ ';
  var _invalidEmail = false;
  var _invalidPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8)
                    ),
                    child: FlutterLogo()),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text("Hello \nWelcome Learn Bridge", style:
                  TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30
                  ),
                  )
              ),


              // email
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "EMAIL",
                    errorText: _invalidEmail ? _emailError : null,
                    labelStyle: TextStyle(color: Color(0xff888888), fontSize: 20, ),
                  ),
                ),
              ),

              //password
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: _passwordController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_statusShowPass,
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _invalidPassword ? _passwordError : null,
                        labelStyle: TextStyle(color: Color(0xff888888), fontSize: 20, ),
                      ),
                    ),
                    GestureDetector(
                        onTap: onToggelShowPass,
                        child: Text( _statusShowPass ? "HIDE" : "SHOW" , style: TextStyle(color: Colors.blue, fontSize: 13),)),
                  ],
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
                    child: Text('Đăng Nhập', style: TextStyle(fontSize: 20, color: Colors.white),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                            )
                        )
                    ),

                  ),
                ),
              ),



            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: registerAccount,
                          child: Text('Đăng ký tài khoản',
                            style: TextStyle(fontSize: 15,
                                color: Color(0xff888888)),
                          ),
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Text('Quên mật khẩu ?',
                            style: TextStyle(fontSize: 15,
                              color: Colors.blue,
                            ),),
                        )
                      ],
                    ),

                  ),
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
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
  void onSignIn() {
    setState(() {
      if (_emailController.text.length < 6 || !_emailController.text.contains("@")) {
        _invalidEmail = true;
      } else {
        _invalidEmail = false;
      }
      if (_passwordController.text.length < 8) {
        _invalidPassword = true;
      } else {
        _invalidPassword = false;
      }

      if (!_invalidEmail && !_invalidPassword) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage() ));
      }
    });
  }
  // chuyển sang màn đăng ký
  void registerAccount() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Register() ));
  }
  // chuyển sang màn quên mật khẩu
  void forgotPassword() {

  }
}
