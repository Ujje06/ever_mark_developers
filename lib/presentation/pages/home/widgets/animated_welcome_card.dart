import 'package:flutter/material.dart';

class AnimatedWelcomeCard extends StatefulWidget {
  const AnimatedWelcomeCard({super.key});

  @override
  State<AnimatedWelcomeCard> createState() => _AnimatedWelcomeCardState();
}

class _AnimatedWelcomeCardState extends State<AnimatedWelcomeCard> with SingleTickerProviderStateMixin {
  late AnimationController _gradientController;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(); // Endlessly cycles the background gradient highlight
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TweenAnimationBuilder handles the scale-up and fade-in automatically on load
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.85, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: AnimatedOpacity(
            opacity: scale == 0.85 ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 400),
            child: child,
          ),
        );
      },
      child: AnimatedBuilder(
        animation: _gradientController,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  Color(0xff7C3AED), // Premium Purple
                  Color(0xff3B82F6), // Tech Blue
                  Color(0xff2563EB),
                ],
                transform: GradientRotation(_gradientController.value * 2 * 3.14159),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff7C3AED).withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "👋",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Manage your dashboard easily.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}