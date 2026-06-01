import 'dart:async';
import 'package:flutter/material.dart';

class TypingTextWidget extends StatefulWidget {
  const TypingTextWidget({super.key});

  @override
  State<TypingTextWidget> createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {

  final String fullText = "Ever Mark Dev";
  String currentText = "";

  int index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    startTyping();
  }

  void startTyping() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 70), // 🔥 speed control
          (timer) {
        if (index < fullText.length) {
          setState(() {
            currentText += fullText[index];
            index++;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      currentText,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}