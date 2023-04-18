import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/am_pm.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/hours.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/minutes.dart';
import 'package:mobile_front_end/utils/constants.dart';

class FixedTimeBox extends StatelessWidget {
  const FixedTimeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("When is a good time?",style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 30,),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyHours(hours: 12),
                SizedBox(
                  width: 10,
                ),
                Text(":", style: TextStyle(fontSize: 35, color: Colors.white),),
                SizedBox(
                  width: 10,
                ),
                MyMinutes(mins: 12),
                SizedBox(
                  width: 10,
                ),
                AmPm(isItAm: true),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.repeat,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Change",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                side: BorderSide(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
        ],
    );
  }
}
