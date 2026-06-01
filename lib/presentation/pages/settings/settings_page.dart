import 'package:ever_mark_developers/presentation/pages/settings/settings_contents.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 Removed hardcoded background color so it automatically switches backgrounds!

      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold), // 🔹 Removed hardcoded black color
        ),
        // 🔹 Removed hardcoded backgroundColor and elevation so it pulls from AppTheme automatically
        centerTitle: false,
      ),

      body: const SettingsContent(),
    );
  }
}