import 'package:flutter/material.dart';

import '../model/status_data.dart';

class StatusLegend extends StatelessWidget {

  final List<StatusData> data;

  const StatusLegend({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(

      builder: (context, constraints) {

        final fontSize =
            constraints.maxWidth * 0.08;

        return Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: data.map((item) {

            return Padding(

              padding:
              const EdgeInsets.only(
                bottom: 12,
              ),

              child: Row(

                children: [

                  Container(

                    width: 14,

                    height: 14,

                    decoration: BoxDecoration(

                      color: item.color,

                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(

                    child: Text(

                      item.label,

                      overflow:
                      TextOverflow.ellipsis,

                      style: TextStyle(

                        fontSize:
                        fontSize.clamp(
                          12,
                          16,
                        ),

                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}