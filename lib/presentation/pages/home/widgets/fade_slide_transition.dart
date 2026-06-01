import 'package:flutter/material.dart';

class FadeSlideTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double slideOffset;

  const FadeSlideTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800), // Slightly longer for a smoother curve
    this.slideOffset = 24.0, // The distance it travels upwards
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      // backOut creates a gorgeous premium spring/elastic bounce at the end
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0.0, 1.0), // Safely handles any curve overflows
          child: Transform.translate(
            // Smoothly moves from [slideOffset] down to 0.0
            offset: Offset(0, slideOffset * (1.0 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}