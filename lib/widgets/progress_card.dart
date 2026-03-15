import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class ProgressCard extends StatefulWidget {
  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  int level = 1;
  int xp = 0;
  int xpNeeded = 250;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..forward();

    _loadProgress();
  }

  Future<void> _loadProgress() async {
    await StorageService.instance.init();
    setState(() {
      level = StorageService.instance.level;
      xp = StorageService.instance.xp;
      xpNeeded = StorageService.instance.xpForLevel(level);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = xp / xpNeeded;
    if (progress > 1) progress = 1;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
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
                    value: progress * controller.value,
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
      },
    );
  }
}