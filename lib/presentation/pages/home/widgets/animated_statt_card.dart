import 'package:flutter/material.dart';

class AnimatedStattCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final int delayMultiplier; // Controls the staggered entrance timing

  const AnimatedStattCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.delayMultiplier,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      // Mathematically staggers the duration based on its layout order
      duration: Duration(milliseconds: 500 + (delayMultiplier * 200)),
      curve: Curves.easeOutBack, // Premium spring/elastic overshoot effect!
      builder: (context, animValue, child) {
        return Opacity(
          opacity: animValue.clamp(0.0, 1.0),
          child: Transform.translate(
            // Slides upward smoothly into its exact layout slot
            offset: Offset(0, 30 * (1.0 - animValue)),
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xff3B82F6).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 26,
                color: const Color(0xff3B82F6),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}