import 'package:flutter/material.dart';





class NavHelper {
  // Pushes a new page onto the stack
  static void goTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Pushes a new page and REMOVES the previous one (Good for Splash -> Login)
  static void goToReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Removes all previous screens (Good for Logout -> Login)
  static void goToAndRemoveAll(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
          (route) => false,
    );
  }

  // Go back
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}