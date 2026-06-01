import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/status_data.dart';

class StatusChart extends StatelessWidget {

  final List<StatusData> data;

  const StatusChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    final total = data.fold(
      0.0,
          (sum, item) => sum + item.value,
    );

    return LayoutBuilder(

      builder: (context, constraints) {

        final chartSize =
            constraints.maxWidth * 0.75;

        final radius =
            chartSize * 0.22;

        final fontSize =
            chartSize * 0.05;

        return SizedBox(

          height: chartSize,

          child: PieChart(

            PieChartData(

              centerSpaceRadius:
              radius * 0.7,

              sectionsSpace: 3,

              sections: data.map((item) {

                final percentage =
                    (item.value / total) * 100;

                return PieChartSectionData(

                  color: item.color,

                  value: item.value,

                  radius: radius,

                  title:
                  "${item.value.toInt()}\n${percentage.toStringAsFixed(1)}%",

                  titleStyle: TextStyle(

                    fontSize: fontSize,

                    fontWeight:
                    FontWeight.bold,

                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}