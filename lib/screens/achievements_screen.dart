import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../data/achievement_data.dart';
import '../services/storage_service.dart';

class AchievementsScreen extends StatefulWidget {
  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  List<String> unlocked = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await StorageService.instance.init();
    setState(() {
      unlocked = StorageService.instance.unlockedAchievementsIds;
    });
  }

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
            'Achievements',
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
          itemCount: allAchievements.length,
          itemBuilder: (context, index) {
            final item = allAchievements[index];
            final isUnlocked = unlocked.contains(item.id);
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: isUnlocked
                      ? [
                          Color(0xFF9FD9FF),
                          Color(0xFF6AB8F7),
                        ]
                      : [
                          Color(0xFF2A2A2A),
                          Color(0xFF1A1A1A),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: isUnlocked
                    ? [
                        BoxShadow(
                          color: Color(0xFF6AB8F7).withOpacity(0.45),
                          blurRadius: 24,
                          offset: Offset(0, 10),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isUnlocked ? Colors.white : Colors.white10,
                    ),
                    child: Icon(
                      Iconsax.medal_star,
                      size: 24,
                      color: isUnlocked ? Colors.black87 : Colors.white70,
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: isUnlocked ? Colors.black87 : Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            color: isUnlocked ? Colors.black87.withOpacity(0.7) : Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '+${item.xp} XP',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isUnlocked ? Colors.black87 : Colors.white70,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isUnlocked ? Colors.black.withOpacity(0.08) : Colors.white10,
                        ),
                        child: Text(
                          isUnlocked ? 'Unlocked' : 'Locked',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: isUnlocked ? Colors.black87 : Colors.white70,
                          ),
                        ),
                      ),
                    ],
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