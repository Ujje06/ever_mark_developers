import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 🔹 Added Provider import

// 🔹 Import your theme provider (Adjust this path if it's different in your project)
import '../../../core/theme/theme_provider.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  // Demo states for other toggles
  bool _notificationsEnabled = true;
  bool _biometricLogin = true;

  @override
  Widget build(BuildContext context) {
    // 🔹 Look up the current theme status from the provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      children: [
        // Profile Section
        _buildProfileCard(context), // 🔹 Passed context here
        const SizedBox(height: 24),

        // Section: Preferences
        _buildSectionHeader('App Preferences'),
        const SizedBox(height: 8),
        _buildSettingsCard(
          context, // 🔹 Passed context here
          children: [
            _buildSwitchTile(
              icon: Icons.notifications_none_rounded,
              iconColor: Colors.blue,
              title: 'Push Notifications',
              subtitle: 'Receive company alerts & updates',
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildDivider(),

            // 🌟 UPDATED DARK MODE SWITCH TILE 🌟
            _buildSwitchTile(
              icon: Icons.dark_mode_outlined,
              iconColor: Colors.purple,
              title: 'Dark Mode',
              subtitle: 'Reduce eye strain at night',
              // 🔹 Reads directly from your global ThemeProvider state
              value: themeProvider.isDarkMode,
              onChanged: (bool value) {
                // 🔹 Updates the theme across the entire application globally!
                themeProvider.toggleTheme(value);
              },
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Section: Security
        _buildSectionHeader('Security & Privacy'),
        const SizedBox(height: 8),
        _buildSettingsCard(
          context, // 🔹 Passed context here
          children: [
            _buildSwitchTile(
              icon: Icons.fingerprint_rounded,
              iconColor: Colors.green,
              title: 'Biometric ID',
              subtitle: 'Use Face ID or Touch ID to log in',
              value: _biometricLogin,
              onChanged: (bool value) {
                setState(() {
                  _biometricLogin = value;
                });
              },
            ),
            _buildDivider(),
            _buildNavigationTile(
              icon: Icons.lock_outline_rounded,
              iconColor: Colors.orange,
              title: 'Change Password',
              onTap: () {
                // TODO: Navigate to change password page
              },
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Section: Account Actions
        _buildSettingsCard(
          context, // 🔹 Passed context here
          children: [
            _buildNavigationTile(
              icon: Icons.logout_rounded,
              iconColor: Colors.redAccent,
              title: 'Log Out',
              textColor: Colors.redAccent,
              showTrailing: false,
              onTap: () {
                // TODO: Implement log out logic
              },
            ),
          ],
        ),
      ],
    );
  }

  // --- Helper UI Widgets ---

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // 🔹 Updated to dynamically change colors based on Light/Dark theme context
  Widget _buildSettingsCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // 🔹 Removed hardcoded Colors.white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // 🔹 Updated to dynamically change colors based on Light/Dark theme context
  Widget _buildProfileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // 🔹 Removed hardcoded Colors.white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: const Icon(Icons.person_rounded, size: 32, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Software Engineer | IT Dept',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile.adaptive(
      secondary: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    );
  }

  Widget _buildNavigationTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    bool showTrailing = true,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: textColor)),
      trailing: showTrailing ? Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey[400]) : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 64,
    );
  }
}