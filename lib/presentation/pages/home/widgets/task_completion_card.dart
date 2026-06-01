// presentation/pages/home/widgets/task_completion_card.dart
import 'package:flutter/material.dart';

class TaskCompletionCard extends StatelessWidget {
  const TaskCompletionCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo metrics data mapping: Day -> Completion Percentage
    final List<Map<String, dynamic>> chartData = [
      {'day': 'Mon', 'value': 0.45},
      {'day': 'Tue', 'value': 0.70},
      {'day': 'Wed', 'value': 0.55},
      {'day': 'Thu', 'value': 0.90},
      {'day': 'Fri', 'value': 0.82},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 16,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Task Completion Analytics",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 24),

          // Graph Layout Axis Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(chartData.length, (index) {
              final item = chartData[index];

              return Column(
                children: [
                  // Growth Animation Track Pillar
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: item['value']),
                    duration: Duration(milliseconds: 600 + (index * 150)),
                    curve: Curves.easeOutBack, // Smooth overshoot effect
                    builder: (context, scaleFactor, child) {
                      return Container(
                        width: 24,
                        height: 120 * scaleFactor, // Scale up height linearly
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: index == 3 // Highlight peak performance day (Thu)
                                ? [const Color(0xff7C3AED), const Color(0xff3B82F6)]
                                : [const Color(0xFFE2E8F0), const Color(0xFFCBD5E1)],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['day'],
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF64748B)),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}