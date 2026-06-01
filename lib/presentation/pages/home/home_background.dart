import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;

  const HomeBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff050505),
            Color(0xff0B1020),
            Color(0xff111111),
          ],
        ),
      ),

      child: Stack(
        children: [

          Positioned(
            top: -80,
            left: -50,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff7C3AED)
                    .withValues(alpha: 0.18),
              ),
            ),
          ),

          Positioned(
            top: 120,
            right: -70,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff3B82F6)
                    .withValues(alpha: 0.16),
              ),
            ),
          ),

          Positioned(
            bottom: -60,
            left: 40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.03),
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}