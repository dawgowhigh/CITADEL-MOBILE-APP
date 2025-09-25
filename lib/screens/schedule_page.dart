// schedule_page.dart
import 'package:flutter/material.dart';
import 'program_page.dart'; // ✅ i-import na lang dito

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: [
          // 👉 Page 1: Schedule
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "My Schedule",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "For 1st Semester",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            "12 September 2025",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Days Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ["S", "M", "T", "W", "T", "F", "S"]
                      .map(
                        (day) => Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: day == "M"
                                ? Colors.green[100]
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            day,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: day == "M" ? Colors.green : Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 16),

                // Schedule List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: const [
                      ScheduleCard(
                        subject: "Computer Programming",
                        code: "CCS 101",
                        room: "301 - North",
                        section: "BSIT 2A",
                        time: "11:00 - 14:00",
                        isHighlighted: true,
                      ),
                      SizedBox(height: 12),
                      ScheduleCard(
                        subject: "Web Development",
                        code: "CCS 202",
                        room: "302 - South",
                        section: "BSIT 2A",
                        time: "08:00 - 11:00",
                      ),
                      SizedBox(height: 12),
                      ScheduleCard(
                        subject: "Database Systems",
                        code: "CCS 303",
                        room: "303 - West",
                        section: "BSIT 2A",
                        time: "14:00 - 17:00",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 👉 Page 2: swipe papunta sa ProgramPage
          const ProgramPage(),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String code;
  final String room;
  final String section;
  final String time;
  final bool isHighlighted;

  const ScheduleCard({
    super.key,
    required this.subject,
    required this.code,
    required this.room,
    required this.section,
    required this.time,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.green[200] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(code),
          const SizedBox(height: 4),
          Text("$room   $time"),
          const SizedBox(height: 4),
          Text(section),
        ],
      ),
    );
  }
}
