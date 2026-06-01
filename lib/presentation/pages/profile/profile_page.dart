import 'package:flutter/material.dart';
// 🔹 Import your profile content file once you create it
import 'profile_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Automatically scales background color based on light/dark mode
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Profile',
            onPressed: () {  },
          ),
        ],
      ),

      // This will load the beautiful profile details you request next
      body: const ProfileContent(),
    );
  }
}