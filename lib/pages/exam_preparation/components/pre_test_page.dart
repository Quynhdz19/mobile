import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class PreTestPage extends StatefulWidget {
  const PreTestPage({Key? key}) : super(key: key);

  @override
  State<PreTestPage> createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.alarm, color: Color(0xFFE57373),),
              const SizedBox(width: 10),
              Text("01:00:00", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: primaryColor
              ),)
            ],
          ),
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://trangkorean.com/wp-content/uploads/2019/09/IMG_3693-1.jpg")),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24)),
              child: Text("Take Test"))
        ],
      ),
    );
  }
}