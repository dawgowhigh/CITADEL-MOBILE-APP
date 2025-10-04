import 'package:citadel/screens/login_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 Back Button + Title
              Row(
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 👤 Profile Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      "assets/images/profile_picture.jpg",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Dumbledore Hogwarts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Sora",
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Professor",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Trispace",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // ⚙️ Account Section
              buildSectionTitle("Account"),
              _buildSettingItem(Icons.person_outline, "My Profile"),
              _buildSettingItem(Icons.notifications_none, "Notifications"),

              const SizedBox(height: 24),

              // 🆘 Help Center
              buildSectionTitle("Help Center"),
              _buildSettingItem(
                Icons.help_outline,
                "Frequently Asked Questions",
              ),
              _buildSettingItem(
                Icons.chat_bubble_outline,
                "Get in Touch with Us",
              ),

              const SizedBox(height: 24),

              // 🛡️ About Section
              buildSectionTitle("About Citadel"),
              _buildSettingItem(Icons.lock_outline, "Privacy Statement"),
              _buildSettingItem(Icons.article_outlined, "Terms and Conditions"),

              const SizedBox(height: 56),

              // 🚪 Sign Out
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder:(context) => const LoginPage()),
                  ); // Handle sign out logic here
                },
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Color(0xFFE53935), size: 28),
                    SizedBox(width: 12),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Color(0xFFE53935),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "Sora",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🧩 Section Title Widget
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          fontFamily: "Sora",
        ),
      ),
    );
  }

  // 🧩 Setting Item Widget
  Widget _buildSettingItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87, size: 28),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontFamily: "Sora",
            ),
          ),
        ],
      ),
    );
  }
}
