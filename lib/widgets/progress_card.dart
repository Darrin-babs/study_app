import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final int level;
  final int xp;
  final int xpNeeded;

  const ProgressCard({
    Key? key,
    required this.level,
    required this.xp,
    required this.xpNeeded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = xp / xpNeeded;
    if (progress > 1) progress = 1;

    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
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
            color: Color(0xFF6AB8F7).withOpacity(0.35),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // LEVEL TEXT
          Text(
            'Level $level',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 12),

          // XP BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.white.withOpacity(0.35),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),

          SizedBox(height: 12),

          // XP TEXT
          Text(
            '$xp / $xpNeeded XP',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 4),

          // MOTIVATION
          Text(
            'Keep pushing to level up',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }
}