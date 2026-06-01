// presentation/pages/home/widgets/home_screen_background.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreenBackground extends StatefulWidget {
  final Widget child;

  const HomeScreenBackground({
    super.key,
    required this.child,
  });

  @override
  State<HomeScreenBackground> createState() => _HomeScreenBackgroundState();
}

class _HomeScreenBackgroundState extends State<HomeScreenBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _purpleMovement;
  late Animation<Offset> _blueMovement;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);

    _purpleMovement = Tween<Offset>(
      begin: const Offset(-0.2, -0.1),
      end: const Offset(0.2, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _blueMovement = Tween<Offset>(
      begin: const Offset(0.1, 0.1),
      end: const Offset(-0.2, -0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Fluid Ambient Orbits
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment(_purpleMovement.value.dx, _purpleMovement.value.dy),
                  child: Container(
                    width: 350,
                    height: 350,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF7C3AED).withOpacity(0.06),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(_blueMovement.value.dx, _blueMovement.value.dy),
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF3B82F6).withOpacity(0.05),
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        // 2. High-Density Vector Smudge Blur
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(color: Colors.transparent),
          ),
        ),

        // 3. User Interface Content Overlay
        Positioned.fill(
          child: widget.child,
        ),
      ],
    );
  }
}