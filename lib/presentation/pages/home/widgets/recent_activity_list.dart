// presentation/pages/home/widgets/recent_activity_list.dart
import 'package:flutter/material.dart';

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> activities = [
      {'title': 'John Doe marked Present', 'time': 'Just now', 'type': 'attendance'},
      {'title': 'New project "Nexus Mobile" created', 'time': '10 mins ago', 'type': 'project'},
      {'title': 'Server infrastructure scaled up', 'time': '1 hour ago', 'type': 'system'},
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
            "Recent Activity",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final item = activities[index];

              // Staggered slide from left entry calculation
              return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 400 + (index * 150)),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(-40 * (1.0 - value), 0), // Slides from Left to Right
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _getIconColor(item['type']!).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(_getIcon(item['type']!), color: _getIconColor(item['type']!), size: 18),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']!,
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF334155)),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item['time']!,
                              style: const TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String type) {
    if (type == 'attendance') return Icons.badge_outlined;
    if (type == 'project') return Icons.assignment_outlined;
    return Icons.dns_outlined;
  }

  Color _getIconColor(String type) {
    if (type == 'attendance') return Colors.blue;
    if (type == 'project') return Colors.purple;
    return Colors.amber;
  }
}