import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile_front_end/pages/profile/learnProcessPage/components/line_titles.dart';

class LineChartWidget extends StatelessWidget {
  // LineChartWidget({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a)
  ];

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 300,
    width: double.infinity,
    child: LineChart(LineChartData(
            minX: 1,
            maxX: 7,
            minY: 0,
            maxY: 10,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
              show: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  // color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: false,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  // color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            // borderData: FlBorderData(
            //   show: true,
            //   border: Border.all(color: const Color(0xff37434d), width: 1),
            // ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(1, 2),
                  FlSpot(2, 4),
                  FlSpot(3, 3),
                  FlSpot(4, 4),
                  FlSpot(5, 5),
                  FlSpot(6, 8),
                  FlSpot(7, 3),

                ],
                isCurved: true,
                barWidth: 5,
              )
            ])),
  );
}
