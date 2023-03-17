import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/OTP_verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    var _emailError = 'Invalid email.';
    var _invalidEmail = false;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Image.asset("assets/images/forgot-password.jpeg"),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Forgot password",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Enter your email to receive a code to reset your password.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _emailController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    size: 36,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPVerificationPage()));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
