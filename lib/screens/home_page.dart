import 'package:flutter/material.dart';
import 'schedule_page.dart'; // 📅 Schedule Page
import 'program_page.dart'; // 🎓 Program Page

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

    final weekday = weekdays[dt.weekday - 1];
    final month = months[dt.month];
    return '$weekday, $month ${dt.day}, ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final today = _formatDate(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF8),

      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: [
          _buildHomeContent(today), // 🏠 Home content
          const SchedulePage(),     // 📅 Schedule page
          const ProgramPage(),      // 🎓 Program page
          const Center(child: Text("⚙️ Settings Page")),
        ],
      ),

      // Bottom Navigation
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
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Programs"), // ✅ updated
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  // ======================
  // 🏠 HOME CONTENT
  // ======================
  Widget _buildHomeContent(String today) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Hello Professor,\nDumbledore!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(today, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 20),

            // Next Class Card
            _nextClassCard(),

            const SizedBox(height: 20),

            // Overview
            const Text(
              "Here's your overview today",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _overviewCard(
                    icon: Icons.school,
                    color: Colors.green,
                    bg: Colors.green.shade100,
                    value: "07",
                    label: "Programs",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _overviewCard(
                    icon: Icons.people_alt,
                    color: Colors.deepOrange,
                    bg: Colors.orange.shade100,
                    value: "100",
                    label: "Students",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Attendance Section
            const Text(
              "Check your student attendance",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _attendanceCard(
                    title: "BSIT 2A",
                    students: "46 Students",
                    imageUrl: "https://picsum.photos/200/120",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _attendanceCard(
                    title: "BSIT 3A",
                    students: "36 Students",
                    imageUrl: "https://picsum.photos/200/121",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ======================
  // 🔹 Widgets
  // ======================

  Widget _nextClassCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your next class",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "IT 101 – Computer Programming",
              style: TextStyle(fontSize: 14),
            ),
            const Text("BSIT 2A", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                    foregroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  child: const Text("See now"),
                ),
                const Icon(Icons.bookmark_border_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _overviewCard({
    required IconData icon,
    required Color color,
    required Color bg,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _attendanceCard({
    required String title,
    required String students,
    required String imageUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(students, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: navigate to attendance page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                    foregroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("See more"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
