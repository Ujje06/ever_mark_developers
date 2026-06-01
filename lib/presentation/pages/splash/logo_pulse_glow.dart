import 'package:flutter/material.dart';

class LogoPulseGlow extends StatefulWidget {
  const LogoPulseGlow({super.key});

  @override
  State<LogoPulseGlow> createState() => _LogoPulseGlowState();
}

class _LogoPulseGlowState extends State<LogoPulseGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.35,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    opacityAnimation = Tween<double>(
      begin: 0.18,
      end: 0.05,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Container(
            height: 145,
            width: 145,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 45,
                  spreadRadius: 8,
                  color: Colors.white.withValues(
                    alpha: opacityAnimation.value,
                  ),
                ),
                BoxShadow(
                  blurRadius: 70,
                  spreadRadius: 12,
                  color: Colors.blue.withValues(
                    alpha: opacityAnimation.value * 0.7,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}