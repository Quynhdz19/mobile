import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_front_end/pages/introduction/introduction_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mobile_front_end/auth/login.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Lottie.network("https://assets9.lottiefiles.com/packages/lf20_jFtJZy.json")
//         ],
//       ),
//     )
//
//
//       // AnimatedSplashScreen(duration: 1000,
//       //   splash: Icons.book,
//       //   nextScreen: LoginPage(),
//       //   splashTransition: SplashTransition.fadeTransition,
//       //   // pageTransitionType: PageTransitionType.scale,
//       //   backgroundColor: Colors.blue);
//   }
// }

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
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
              "https://assets9.lottiefiles.com/packages/lf20_jFtJZy.json",
              controller: animationController, onLoaded: (gif) {
            animationController
              ..duration = gif.duration
              ..forward().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroductionPage()));
              });
          }),
        ],
      ),
    );
  }
}
