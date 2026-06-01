import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  const NotificationDialog({super.key});

  // Static helper method to make triggering the dialog easy from any screen
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6), // Darkens background
      builder: (context) => const NotificationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      alignment: Alignment.topRight, // Aligns directly beneath the navbar icon
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF13131A), // Matches dark layout aesthetic
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 24,
              offset: const Offset(0, 12),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wraps around contents tightly
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.notifications_active, color: Color(0xFF7C3AED), size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Clear all",
                    style: TextStyle(color: Color(0xFF3B82F6), fontSize: 12),
                  ),
                )
              ],
            ),
            const Divider(color: Colors.white10, height: 16),

            // Demo Notification Item 1
            _buildNotificationItem(
              icon: Icons.assignment_turned_in_rounded,
              iconColor: Colors.green,
              title: "Project Atlas Updated",
              time: "2 mins ago",
              description: "Tech stack milestone achieved! TensorFlow model optimization deployed successfully.",
            ),

            // Demo Notification Item 2
            _buildNotificationItem(
              icon: Icons.security_rounded,
              iconColor: Colors.amber,
              title: "Security Alert",
              time: "1 hour ago",
              description: "Your session token was renewed from an authorized workstation terminal access.",
            ),

            const SizedBox(height: 8),

            // Footer Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.04),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "View All Notifications",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Row layout block component for individual notification logs
  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.white38, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}