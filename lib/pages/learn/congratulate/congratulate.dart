import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_front_end/pages/introduction/introduction_page.dart';
import 'package:mobile_front_end/pages/main_page.dart';

import '../../../utils/constants.dart';
import '../topic/topic.dart';

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
              "https://assets6.lottiefiles.com/packages/lf20_mbznsnmf.json",
              controller: animationController, onLoaded: (gif) {
            animationController
              ..duration = gif.duration
              ..forward().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage()));
              });
          }),
          Center(
            child: Text('Congratulate',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontFamily: GoogleFonts.poppins().toString()
            ),),

          )
        ],
      ),
    );
  }
}
