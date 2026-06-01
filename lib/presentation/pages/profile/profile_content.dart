import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      children: [
        // 1. Hero Profile Header
        _buildProfileHero(context),
        const SizedBox(height: 24),

        // 2. Section: Employment Information
        _buildSectionHeader('Employment Details'),
        const SizedBox(height: 8),
        _buildInfoCard(
          context,
          children: [
            _buildInfoRow(Icons.badge_outlined, Colors.blue, 'Employee ID', 'EMP-2026-8942'),
            _buildDivider(),
            _buildInfoRow(Icons.corporate_fare_rounded, Colors.orange, 'Department', 'Information Technology'),
            _buildDivider(),
            _buildInfoRow(Icons.work_outline_rounded, Colors.green, 'Designation', 'Software Engineer'),
            _buildDivider(),
            _buildInfoRow(Icons.calendar_today_rounded, Colors.purple, 'Joining Date', 'March 15, 2026'),
          ],
        ),
        const SizedBox(height: 24),

        // 3. Section: Personal & Contact Information
        _buildSectionHeader('Contact Information'),
        const SizedBox(height: 8),
        _buildInfoCard(
          context,
          children: [
            _buildInfoRow(Icons.email_outlined, Colors.teal, 'Email Address', 'john.doe@company.com'),
            _buildDivider(),
            _buildInfoRow(Icons.phone_android_rounded, Colors.pink, 'Phone Number', '+1 (555) 019-2834'),
            _buildDivider(),
            _buildInfoRow(Icons.location_on_outlined, Colors.redAccent, 'Office Location', 'Tech Park, Block C, 4th Floor'),
          ],
        ),
      ],
    );
  }

  // --- UI Helper Layout Components ---

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
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

  // Wraps data records inside a polished modern card structure
  Widget _buildInfoCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // Large elegant header displaying the employee avatar image/placeholder
  Widget _buildProfileHero(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: const Icon(Icons.person_rounded, size: 64, color: Colors.blue),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'John Doe',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'IT Department',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // A single clean data field row displaying property name and dynamic value
  Widget _buildInfoRow(IconData icon, Color iconColor, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 60,
      endIndent: 16,
    );
  }
}