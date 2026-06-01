import 'package:flutter/material.dart';

class BottomBrandCaption extends StatefulWidget {
  const BottomBrandCaption({super.key});

  @override
  State<BottomBrandCaption> createState() => _BottomBrandCaptionState();
}

class _BottomBrandCaptionState extends State<BottomBrandCaption> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        setState(() {
          opacity = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 900),
      opacity: opacity,
      child: Text(
        "Since 2020",
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.65),
          fontSize: 13,
          letterSpacing: 2,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}