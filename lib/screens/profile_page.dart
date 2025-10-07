import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
       backgroundColor: const Color(0xFFF9FFFA),
      ),
      body: const Center(
        child: Text(
          "This is your profile page 🧍‍♀️",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
