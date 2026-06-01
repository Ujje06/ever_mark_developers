import 'package:flutter/material.dart';




class AppNavigator {
  /// 1. Replace the current screen (Login -> Home)
  /// Using a FadeTransition for a premium feel.
  static void goTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  /// 2. Standard Push (Home -> Profile)
  /// Allows the user to press 'Back'.
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// 3. Logout / Clear All (Settings -> Login)
  /// This deletes the entire history so the user can't go back at all.
  static void logout(BuildContext context, Widget loginPage) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => loginPage),
          (route) => false,
    );
  }

  /// 4. Go Back
  static void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}