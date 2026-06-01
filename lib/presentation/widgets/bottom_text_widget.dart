import 'package:flutter/material.dart';






class BottomTextWidget extends StatefulWidget {
  const BottomTextWidget({super.key});

  @override
  State<BottomTextWidget> createState() => _BottomTextWidgetState();
}

class _BottomTextWidgetState extends State<BottomTextWidget> {

  double opacity = 0.0;
  double translateY = 20; // start slightly below

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        opacity = 1.0;
        translateY = 0; // move to original position
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: opacity,

      child: Transform.translate(
        offset: Offset(0, translateY),

        child: const Text(
          "Powered by EverMark",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}