import 'package:flutter/material.dart';

import 'model/status_data.dart';

import 'widgets/status_chart.dart';
import 'widgets/status_header.dart';
import 'widgets/status_legend.dart';

class StatusDistributionCard extends StatelessWidget {

  final List<StatusData> data;

  final String title;

  const StatusDistributionCard({
    super.key,
    required this.data,
    this.title = "Status Distribution",
  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(

      builder: (context, constraints) {

        /// AVAILABLE WIDTH FROM PARENT
        final double cardWidth =
            constraints.maxWidth;

        /// RESPONSIVE BREAKPOINT
        final bool isMobile =
            cardWidth < 600;

        return Container(

          width: double.infinity,

          // margin: const EdgeInsets.all(5),

          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius:
            BorderRadius.circular(24),

            boxShadow: const [

              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, 4),
              ),
            ],
          ),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// =========================
              /// HEADER
              /// =========================

              StatusHeader(
                title: title,
              ),

              // const SizedBox(height: 2),




              /// =========================
              /// RESPONSIVE CONTENT
              /// =========================

              isMobile

              /// MOBILE LAYOUT
                  ? Column(

                children: [

                  /// PIE CHART
                  StatusChart(
                    data: data,
                  ),

                  // const SizedBox(
                  //   height: 14,
                  // ),

                  /// LEGEND
                  StatusLegend(
                    data: data,
                  ),
                ],
              )

              /// TABLET / LARGE SCREEN LAYOUT
                  : Row(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// PIE CHART
                  Expanded(

                    flex: 2,

                    child: StatusChart(
                      data: data,
                    ),
                  ),

                  // const SizedBox(
                  //   width: 20,
                  // ),

                  /// LEGEND
                  Expanded(

                    child: StatusLegend(
                      data: data,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}