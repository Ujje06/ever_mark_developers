import 'package:flutter/material.dart';




class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {


    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff7C3AED),
            Color(0xff3B82F6),
          ],
        ),
      ),
      accountName: Text( "User"),
      accountEmail: Text("email"),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          color: Colors.black,
          size: 32,
        ),
      ),
    );
  }
}