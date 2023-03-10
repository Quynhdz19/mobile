import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mobile_front_end/auth/login.dart';

// class IntroductionPage extends StatelessWidget {
//   const IntroductionPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: RotationTransition(
//               turns: null,
//               child: SizedBox(
//                 height: 200,
//                 width: 200,
//                 child: Image.asset('assets/mobile_logo.png'),
//               ),
//             ),
//           ),
//           AnimatedTextKit(animatedTexts: [
//             RotateAnimatedText('Welcome to LearnBridge !',
//                 textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             TypewriterAnimatedText('Let\'s start learning now!')
//           ])
//         ],
//       ),
//     );
//   }
// }

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    // animationController.repeat(reverse: false, period: Duration(seconds: 3));
  }

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
          Center(
            child: RotationTransition(
              turns: animation,
              // child: SizedBox(
              //   height: 200,
              //   width: 200,
              //   child: Image.asset('images/mobile_logo.png',
              //       width: 200, height: 200, fit: BoxFit.cover),
              // ),
              child: CircleAvatar(
                // minRadius: 50,
                radius: 100,
                backgroundImage: AssetImage("images/mobile_logo.png"),
                // child: ClipRRect(
                //   // borderRadius: BorderRadius.circular(50),
                //   child: Image.asset('images/mobile_logo.png',
                //       width: 600, height: 600, fit: BoxFit.cover),
                // ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          AnimatedTextKit(animatedTexts: [
            TypewriterAnimatedText('Welcome to LearnBridge!',
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w500))
          ]),
          SizedBox(
            height: 180,
          ),
          Column(children: [
            Text("headline1", style: Theme.of(context).textTheme.headline1,),
            Text("headline2", style: Theme.of(context).textTheme.headline2,),
            Text("headline3", style: Theme.of(context).textTheme.headline3,),
            Text("headline4", style: Theme.of(context).textTheme.headline4,),
            Text("headline6", style: Theme.of(context).textTheme.headline6,),
            Text("subtitle2", style: Theme.of(context).textTheme.subtitle2,),
            Text("bodyText1", style: Theme.of(context).textTheme.bodyText1,),
            // Text("headline1", style: Theme.of(context).textTheme.headline1,),

          ],),
          ElevatedButton(
            style:
            // Theme.of(context).elevatedButtonTheme.style,

            ElevatedButton.styleFrom(
              primary: Colors.blue, // background
              onPrimary: Colors.white, // foreground
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Get Started !',
                style:
                // Theme.of(context).textTheme.headline3
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
          )
        ],
      ),
    );
  }
}
