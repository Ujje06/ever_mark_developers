import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {

  final bool isActive;

  final Widget child;

  const ScaleAnimation({
    super.key,
    required this.isActive,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedScale(

      duration: const Duration(
        milliseconds: 220,
      ),

      curve: Curves.easeInOut,

      scale: isActive ? 1.08 : 1.0,

      child: child,
    );
  }
}