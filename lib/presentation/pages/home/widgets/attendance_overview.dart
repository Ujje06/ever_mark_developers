// presentation/pages/home/widgets/attendance_overview.dart
import 'package:flutter/material.dart';

class AttendanceOverview extends StatefulWidget {
  const AttendanceOverview({super.key});

  @override
  State<AttendanceOverview> createState() => _AttendanceOverviewState();
}

class _AttendanceOverviewState extends State<AttendanceOverview> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    // Trigger the dial progress animation on frame mount
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() => _progress = 0.816); // Represents 81.6% attendance rate
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Attendance Rate",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 8),
                Text(
                  "Excellent team presence this week. Keep up the high engagement!",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          // Radial progress block container
          SizedBox(
            width: 90,
            height: 90,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.fastOutSlowIn,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: _progress),
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.fastOutSlowIn,
                    builder: (context, value, child) {
                      return CircularProgressIndicator(
                        value: value,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey.shade100,
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff7C3AED)),
                        strokeCap: StrokeCap.round,
                      );
                    },
                  ),
                ),
                Text(
                  "${(_progress * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}