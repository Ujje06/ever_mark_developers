import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedBrandText extends StatefulWidget {
  const AnimatedBrandText({super.key});

  @override
  State<AnimatedBrandText> createState() => _AnimatedBrandTextState();
}

class _AnimatedBrandTextState extends State<AnimatedBrandText>
    with SingleTickerProviderStateMixin {
  final String fullText = "EVER MARK\nDEVELOPERS";

  String visibleText = "";
  int index = 0;

  Timer? typingTimer;
  Timer? cursorTimer;

  bool showCursor = true;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    /// Fade in whole widget
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          opacity = 1.0;
        });
      }
    });

    /// Typing effect
    typingTimer = Timer.periodic(
      const Duration(milliseconds: 95),
          (timer) {
        if (index < fullText.length) {
          setState(() {
            visibleText += fullText[index];
            index++;
          });
        } else {
          timer.cancel();

          setState(() {
            showCursor = false;
          });

          cursorTimer?.cancel();
        }
      },
    );

    /// Blinking cursor
    cursorTimer = Timer.periodic(
      const Duration(milliseconds: 500),
          (timer) {
        if (mounted) {
          setState(() {
            showCursor = !showCursor;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          "$visibleText${showCursor ? "|" : " "}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            height: 1.35,

            /// Glow effect
            shadows: [
              Shadow(
                blurRadius: 8,
                color: Colors.white.withValues(alpha: 0.35),
              ),
              Shadow(
                blurRadius: 16,
                color: Colors.blue.withValues(alpha: 0.20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}