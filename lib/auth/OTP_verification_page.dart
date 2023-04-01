import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/component/OTPBox.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Image.asset("assets/images/otp_verification.png"),
            const SizedBox(
              height: 30,
            ),
            Text(
              "OTP Verification",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter the OTP sent to your email.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                OTPBox(),
                OTPBox(),
                OTPBox(),
                OTPBox(),
                OTPBox(),
                OTPBox(),
              ],
            )),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.blue)))),
                  child: const Text(
                    'Verify',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
