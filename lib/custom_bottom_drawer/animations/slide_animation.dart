import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {

  final bool isActive;

  final Widget child;

  const SlideAnimation({
    super.key,
    required this.isActive,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedSlide(

      duration: const Duration(
        milliseconds: 250,
      ),

      curve: Curves.easeOut,

      offset: isActive
          ? const Offset(0, -0.08)
          : Offset.zero,

      child: child,
    );
  }
}