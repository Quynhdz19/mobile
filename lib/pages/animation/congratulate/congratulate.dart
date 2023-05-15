import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_front_end/pages/introduction/introduction_page.dart';
import 'package:mobile_front_end/pages/main_page.dart';

import '../../../utils/constants.dart';

class CongratulationPage extends StatefulWidget {
  const CongratulationPage({Key? key}) : super(key: key);


  @override
  State<CongratulationPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<CongratulationPage> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://assets9.lottiefiles.com/packages/lf20_l4xxtfd3.json",
              controller: animationController, onLoaded: (gif) {
            animationController
              ..duration = gif.duration
              ..forward().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage(selected: 1,)));
              });
          }),
          Center(
            child: Text('congratulation1'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontFamily: GoogleFonts.poppins().toString(),
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('congratulation2'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                  fontFamily: GoogleFonts.poppins().toString(),
                ),),
              SizedBox(width: 10,),
              Container(
                width: 80,
                height: 80,
                child: Lottie.network(
                    "https://assets6.lottiefiles.com/packages/lf20_FU4CXLdeGm.json",
                    controller: animationController, onLoaded: (gif) {
                  animationController
                    ..duration = gif.duration
                    ..forward().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage(selected: 0,)));
                    });
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
