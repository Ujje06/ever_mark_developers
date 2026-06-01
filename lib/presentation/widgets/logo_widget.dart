
import 'package:flutter/material.dart';



class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.5, // 🔥 start bigger
      end: 1.0,   // 🔥 normal size
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut, // smooth finish
      ),
    );

    _controller.forward(); // start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


// ui part herer

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,

      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,

          child: child,
        );
      },

      child:
          CircleAvatar(radius: 100, backgroundColor: Colors.orange.shade200, backgroundImage: AssetImage("assets/images/evermark_develoers_logo.png"),),
      // UiHelper.customImage(img: "evermark_develoers_logo.png"), // 🔥 put your logo here

    );
  }
}



