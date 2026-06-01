import 'package:flutter/material.dart';

class LogoutDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Row(
          children: [
            Icon(Icons.logout, color: Colors.redAccent),
            SizedBox(width: 10),
            Text("Logout"),
          ],
        ),
        content: const Text(
          "Are you sure you want to sign out of Evermark? Your current session will be ended.",
          style: TextStyle(color: Colors.black87),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        actions: [
          // ❌ CANCEL BUTTON
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ),

          // ✅ CONFIRM LOGOUT BUTTON
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog

              // 🚀 Logic: Clear User Data and Navigate to Login
              // Example: Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => const LoginScreen()),
              //   (route) => false
              // );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out successfully")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}