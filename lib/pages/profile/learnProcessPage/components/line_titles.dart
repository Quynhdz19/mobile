import 'package:fl_chart/fl_chart.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,

        // getTitles: (value) {
        //   switch(value.toInt()) {
        //     case 2:
        //       return 'MAR';
        //     case 5:
        //       return 'JUN';
        //     case 8:
        //       return 'SEP';
        //     case 11:
        //       return 'DEC';
        //   }
        // },
        // margin: 8,
      ),

    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 28
      )
    )
  );
}