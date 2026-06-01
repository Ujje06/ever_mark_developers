import 'package:flutter/material.dart';

class AnimatedGradientWrapper extends StatefulWidget {
  final Widget child;

  const AnimatedGradientWrapper({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradientWrapper> createState() =>
      _AnimatedGradientWrapperState();
}

class _AnimatedGradientWrapperState
    extends State<AnimatedGradientWrapper> {

  final List<Color> colorList = [
    Color(0xFF000000), // pure black
    Color(0xFF1C1C1C), // dark gray
    Color(0xFF2C2C54), // deep blue gray
    Color(0xFF3B0A0A), // dark blood red
    Color(0xFF4A4A4A), // medium gray
    Color(0xFF0D1B2A), // navy dark blue
    Color(0xFF5C0000), // rich dark red

  ];

  int index = 0;

  late Color topColor;
  late Color bottomColor;

  @override
  void initState() {
    super.initState();

    topColor = colorList[0];
    bottomColor = colorList[1];

    // Start first animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        index = 1;
        topColor = colorList[index];
        bottomColor = colorList[index + 1];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedContainer(
        duration: const Duration(seconds: 4),
        curve: Curves.easeInOut,
        onEnd: () {
          setState(() {
            index = (index + 1) % colorList.length;

            topColor = colorList[index];
            bottomColor =
            colorList[(index + 1) % colorList.length];
          });
        },
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [topColor, bottomColor],
          ),
        ),
        child: widget.child,
      ),
    );
  }
}