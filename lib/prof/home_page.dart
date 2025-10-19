import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/prof/home_page.dart
import 'schedule_page.dart'; // 📅 Schedule Page
import 'program_page.dart'; // 🎓 Program Page
import '../students/settings.dart'; // ⚙️ Settings Page
import 'attendance_page.dart'; // Attendance Page
=======
import 'dart:ui';
import 'schedule_page.dart';
import 'program_page.dart';
import 'settings_page.dart';
import 'attendance_page.dart';
>>>>>>> 6cd0d60 (okay na 'to):lib/screens/home_page.dart

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime dt) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month]} ${dt.day}, ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final today = _formatDate(DateTime.now());

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
<<<<<<< HEAD:lib/prof/home_page.dart
          _buildHomeContent(today), // 🏠 Home
          const SchedulePage(), // 📅 Schedule
          const ProgramPage(), // 🎓 Program
          const Settings(), // ⚙️ Settings
        ],
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
=======
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFFEFFFE)),
            ),
>>>>>>> 6cd0d60 (okay na 'to):lib/screens/home_page.dart
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _selectedIndex = index),
            children: [
              _buildHomeContent(today),
              const SchedulePage(),
              const ProgramPage(),
              const SettingsPage(),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.010,
                  ),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedIndex,
                    selectedItemColor: const Color(0xFF57955A),
                    unselectedItemColor: const Color(0xFF000000),
                    showUnselectedLabels: true,

                    // ✅ Add these to style the labels
                    selectedLabelStyle: const TextStyle(
                      fontFamily: "Sora", // your custom font
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),

                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    items: [
                      _buildNavItem(
                        iconPath: "assets/icons/home_icon.png",
                        label: "Home",
                        index: 0,
                      ),
                      _buildNavItem(
                        iconPath: "assets/icons/schedule_icon.png",
                        label: "Schedule",
                        index: 1,
                      ),
                      _buildNavItem(
                        iconPath: "assets/icons/programs_icon.png",
                        label: "Program",
                        index: 2,
                      ),
                      _buildNavItem(
                        iconPath: "assets/icons/settings_icon.png",
                        label: "Settings",
                        index: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    bool isActive = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: MediaQuery.of(context).size.width * 0.065,
        height: MediaQuery.of(context).size.width * 0.065,
        color: isActive ? const Color(0xFF57955A) : const Color(0xFF000000),
        colorBlendMode: BlendMode.srcIn,
      ),
      label: label,
    );
  }

  Widget _buildHomeContent(String today) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Hello Professor,\nDumbledore!",
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 15,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Container(
                            width: 23,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Container(
                            width: 15,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              today,
              style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF8C8C8C),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your next class",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _nextClassCard(),
            const SizedBox(height: 20),
            const Text(
              "Here's your overview today",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    count: "7",
                    label: "Programs",
                    icon: Icons.school,
                    bgColor: Color(0xFFACFFB3),
                    iconBgColor: Color(0xFF22C55E),
                    countColor: Color(0xFF2D632D),
                    labelColor: Color(0xFF57955A),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    count: "100",
                    label: "Students",
                    icon: Icons.people_alt,
                    bgColor: Color(0xFFFFE2AC),
                    iconBgColor: Color(0xFFF59E0B),
                    countColor: Color(0xFF635A2D),
                    labelColor: Color(0xFF957B57),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Check your student attendance",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _attendanceGrid(),
          ],
        ),
      ),
    );
  }

  Widget _nextClassCard() {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "IT 101 – ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Roboto",
                    ),
                  ),
                  TextSpan(
                    text: "Computer Programming",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "BSIT 2A",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Worksans",
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F8E9),
                    foregroundColor: const Color(0xFF57955A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                  child: const Text(
                    "See now",
                    style: TextStyle(
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: IconButton(
                    iconSize: MediaQuery.of(context).size.width * 0.08,
                    icon: const Icon(
                      Icons.bookmark_border_rounded,
                      color: Color(0xFF57955A),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _attendanceGrid() {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 600 ? 3 : 2;

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: screenWidth < 400
            ? 0.68
            : (screenWidth < 600 ? 0.75 : 0.8),
      ),
      children: [
        _attendanceCard(
          title: "BSIS 1B",
          students: "35 Students",
          imageUrl: "assets/images/section_banner.jpg",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AttendancePage()),
            );
          },
        ),
        _attendanceCard(
          title: "BSIT 2A",
          students: "40 Students",
          imageUrl: "assets/images/section_banner.jpg",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AttendancePage()),
            );
          },
        ),
        _attendanceCard(
          title: "BSEMC 3B",
          students: "28 Students",
          imageUrl: "assets/images/section_banner.jpg",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AttendancePage()),
            );
          },
        ),
        _attendanceCard(
          title: "BSCS 4A",
          students: "32 Students",
          imageUrl: "assets/images/section_banner.jpg",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AttendancePage()),
            );
          },
        ),
      ],
    );
  }

  Widget _attendanceCard({
    required String title,
    required String students,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: "Sora",
              ),
            ),
            Text(
              students,
              style: const TextStyle(
                color: Color(0xFFAEAEAE),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF1F8E9),
                  foregroundColor: const Color(0xFF57955A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  "See more",
                  style: TextStyle(
                    fontFamily: "Sora",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String count;
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconBgColor;
  final Color countColor;
  final Color labelColor;

  const StatCard({
    super.key,
    required this.count,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.iconBgColor,
    required this.countColor,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Trispace",
                  color: countColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: labelColor,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}