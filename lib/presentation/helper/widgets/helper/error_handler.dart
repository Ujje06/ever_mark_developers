import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  // 🧠 WHAT THIS DOES:
  // 1. Logs the error to the terminal/logcat with a timestamp
  // 2. Shows a clean toast message to the user
  static void handleError(dynamic error, {String? customMessage}) {
    String message = customMessage ?? error.toString();

    // 1. PRINT TO TERMINAL (Only in Debug Mode)
    // We use log() instead of print() for better visibility in Logcat
    dev.log(
      '❌ [ERROR]: $message',
      name: 'Evermark.App',
      error: error,
      time: DateTime.now(),
    );

    // 2. SHOW TOAST TO USER
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}