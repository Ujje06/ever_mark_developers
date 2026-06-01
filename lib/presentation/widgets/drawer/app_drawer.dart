// presentation/widgets/drawer/app_drawer.dart

import 'package:flutter/material.dart';
import '../../../core/utils/nav_helper.dart';
import '../../pages/login/login_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String selected = "Home";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff0B0B0F),

      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),

                child: Column(
                  children: [

                    /// ================= HEADER =================
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(14),
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff7C3AED),
                            Color(0xff3B82F6),
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 62,
                            height: 62,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.16),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 34,
                            ),
                          ),

                          const SizedBox(height: 14),

                          const Text(
                            "User",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            "UserDescription",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// ================= MENU ITEMS =================

                    _menuTile(
                      icon: Icons.home_rounded,
                      title: "Home",
                      isSelected: selected == "Home",
                      onTap: () {
                        setState(() => selected = "Home");
                        Navigator.pop(context);
                      },
                    ),

                    _menuTile(
                      icon: Icons.person_outline,
                      title: "Profile",
                      isSelected: selected == "Profile",
                      onTap: () {
                        setState(() => selected = "Profile");
                        Navigator.pop(context);
                      },
                    ),

                    _menuTile(
                      icon: Icons.groups_outlined,
                      title: "Employees",
                      isSelected: selected == "Employees",
                      onTap: () {
                        setState(() => selected = "Employees");
                        Navigator.pop(context);
                      },
                    ),

                    _menuTile(
                      icon: Icons.settings_outlined,
                      title: "Settings",
                      isSelected: selected == "Settings",
                      onTap: () {
                        setState(() => selected = "Settings");
                        Navigator.pop(context);
                      },
                    ),

                    const SizedBox(height: 10),

                    /// ================= LOGOUT =================
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),

                      child: _menuTile(
                        icon: Icons.logout_rounded,
                        title: "Logout",
                        isLogout: true,
                        onTap: () {
                          NavHelper.goToAndRemoveAll(
                            context,
                            const LoginScreen(),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// ================= MENU TILE =================
  Widget _menuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
    bool isSelected = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),

      decoration: BoxDecoration(
        color: isLogout
            ? Colors.redAccent.withValues(alpha: 0.08)
            : isSelected
            ? const Color(0xff7C3AED).withValues(alpha: 0.20)
            : Colors.white.withValues(alpha: 0.03),

        borderRadius: BorderRadius.circular(16),

        border: isSelected
            ? Border.all(
          color: const Color(0xff7C3AED),
          width: 1.2,
        )
            : null,
      ),

      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        leading: Icon(
          icon,
          color: isLogout
              ? Colors.redAccent
              : isSelected
              ? const Color(0xff7C3AED)
              : Colors.white,
        ),

        title: Text(
          title,
          style: TextStyle(
            color: isLogout
                ? Colors.redAccent
                : isSelected
                ? const Color(0xff7C3AED)
                : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.white38,
        ),

        onTap: onTap,
      ),
    );
  }
}