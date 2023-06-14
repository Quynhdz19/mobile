
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/learnProcessPage/components/lineChartWidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../utils/constants.dart';

class StatisticComponent extends StatelessWidget {
  const StatisticComponent({
    Key? key, required this.imgUrl, required this.title, required this.percentage, required this.color, required this.lightColor, required this.percent,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final String percentage;
  final Color color;
  final Color lightColor;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDarkMode ? darkBackgroundColor : Color(0xFFE1F5FE),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(width: 20,),
          Image.network(
            imgUrl,
            width: 50,
            height: 50,
          ),
          // const SizedBox(width:20),
          Text(title,
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(width: 40),
          CircularPercentIndicator(
            radius: 25,
            lineWidth: 10,
            percent: percent,
            progressColor: color,
            backgroundColor: lightColor,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              percentage,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          // const SizedBox(width: 20)
          // LineChartWidget(),
        ],
      ),
    );
  }
}
