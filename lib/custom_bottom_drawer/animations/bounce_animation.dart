import 'package:flutter/material.dart';

class BounceAnimation extends StatelessWidget {

  final bool isActive;

  final Widget child;

  const BounceAnimation({
    super.key,
    required this.isActive,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedScale(

      duration: const Duration(
        milliseconds: 300,
      ),

      curve: Curves.elasticOut,

      scale: isActive ? 1.15 : 1.0,

      child: child,
    );
  }
}