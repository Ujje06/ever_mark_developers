import 'package:ever_mark_developers/presentation/pages/home/widgets/notification_dialog.dart';
import 'package:flutter/material.dart';

class HomeNavbar extends StatefulWidget {
  final VoidCallback onMenuTap;

  const HomeNavbar({
    super.key,
    required this.onMenuTap,
  });

  @override
  State<HomeNavbar> createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Controls the speed of the color flow shift loop (4 seconds)
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(); // Makes it loop endlessly
  }

  @override
  void dispose() {
    _controller.dispose(); // Crucial to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: 70,
          margin: const EdgeInsets.all(14),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            // The magic happens here: the Alignment shifts values dynamically based on controller value
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Color(0xFF1E1E26), // Smooth Dark Slate
                Color(0xFF2D1B4E), // Deep Neon Purple
                Color(0xFF142850), // Cyber Tech Blue
                Color(0xFF1E1E26), // Back to Dark Slate for a smooth seam loop
              ],
              // Moves the gradient spectrum across the canvas dynamically
              transform: GradientRotation(_controller.value * 2 * 3.14159),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7C3AED).withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: child, // Passes down the static UI elements below without rebuilding them
        );
      },
      // Static inner elements wrapped here inside child optimization parameter so they don't repaint
      child: Row(
        children: [
          IconButton(
            onPressed: widget.onMenuTap,
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          const SizedBox(width: 8),
          const Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              NotificationDialog.show(context);
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}