import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../services/navigation_service.dart';
import '../../../../services/locator.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

import '../../../../utils/constants.dart';

class I_Widget extends StatelessWidget {
  I_Widget({Key? key,  this.learning_process, required this.widthBox, this.onTab})
      : super(key: key);
  final learning_process;
  final double widthBox;
  final GestureTapCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      }
      ,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: widthBox,
        height: 100,
        decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1))
            ]),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(learning_process["img"] ?? ''),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Padding(
                  padding: new EdgeInsets.only(left: 10),
                  child: Text(
                    learning_process["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: lightTextColor,
                        fontFamily: GoogleFonts.poppins().toString()
                    ),
                    // Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                 const SizedBox(height: 10,),
                LinearPercentIndicator(
                  width: 150,
                  animation: true,
                  lineHeight: 15.0,
                  animationDuration: 2000,
                  percent: learning_process['percentage']  / 100 as double,
                  center: Text((learning_process['percentage']).toString()),
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.greenAccent,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
