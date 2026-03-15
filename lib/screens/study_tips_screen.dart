import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StudyTipsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tips = [
    {
      'title': 'Short, Focused Sessions',
      'description': 'Study in 25-minute blocks with 5-minute breaks to keep your brain fresh.',
      'icon': Iconsax.timer_1,
      'tag': 'Focus',
    },
    {
      'title': 'Teach It Out Loud',
      'description': 'Explain the topic as if you’re teaching a friend. If you can teach it, you know it.',
      'icon': Iconsax.teacher,
      'tag': 'Memory',
    },
    {
      'title': 'Mix Your Subjects',
      'description': 'Rotate between Math, English, and Science instead of cramming one subject for hours.',
      'icon': Iconsax.repeat,
      'tag': 'Balance',
    },
    {
      'title': 'Active Recall',
      'description': 'Close your notes and try to write everything you remember. Then check what you missed.',
      'icon': Iconsax.note_text,
      'tag': 'Recall',
    },
    {
      'title': 'Sleep > Cramming',
      'description': 'A rested brain remembers more than a tired one. Protect your sleep before tests.',
      'icon': Iconsax.moon,
      'tag': 'Health',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0A1A2F),
            Color(0xFF0F2B46),
            Color(0xFF1B3B5A),
            Color(0xFF6AB8F7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Study Tips',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: tips.length,
          itemBuilder: (context, index) {
            final tip = tips[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF9FD9FF),
                    Color(0xFF6AB8F7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF6AB8F7).withOpacity(0.45),
                    blurRadius: 24,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.06),
                    ),
                    child: Icon(
                      tip['icon'] as IconData,
                      size: 22,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip['title'] as String,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          tip['description'] as String,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            height: 1.4,
                            color: Colors.black87.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.06),
                            ),
                            child: Text(
                              tip['tag'] as String,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}