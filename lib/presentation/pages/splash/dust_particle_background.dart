import 'dart:math';
import 'package:flutter/material.dart';

class DustParticleBackground extends StatefulWidget {
  const DustParticleBackground({super.key});

  @override
  State<DustParticleBackground> createState() =>
      _DustParticleBackgroundState();
}

class _DustParticleBackgroundState
    extends State<DustParticleBackground>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size.infinite,
            painter: DustPainter(controller.value),
          );
        },
      ),
    );
  }
}

class DustPainter extends CustomPainter {
  final double progress;
  final Random random = Random(7);

  DustPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 28; i++) {
      final baseX = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;

      final y =
          (baseY - (progress * 120) + (i * 10)) % size.height;

      final radius = random.nextDouble() * 2.2 + 0.6;

      canvas.drawCircle(
        Offset(baseX, y),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}