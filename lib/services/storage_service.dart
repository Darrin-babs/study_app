import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();
  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('StorageService not initialized. Call init() first.');
    }
    return _prefs!;
  }

  int get xp => prefs.getInt('xp') ?? 0;
  int get level => prefs.getInt('level') ?? 1;
  int get streak => prefs.getInt('streak') ?? 0;
  String? get lastStudyDate => prefs.getString('lastStudyDate');

  Future<void> setXP(int value) async {
    await prefs.setInt('xp', value);
  }

  Future<void> setLevel(int value) async {
    await prefs.setInt('level', value);
  }

  Future<void> setStreak(int value) async {
    await prefs.setInt('streak', value);
  }

  Future<void> setLastStudyDate(String date) async {
    await prefs.setString('lastStudyDate', date);
  }

  int xpForLevel(int level) {
    return 250 + (level - 1) * 200;
  }

  Future<void> addXP(int amount) async {
    int currentXP = xp + amount;
    int currentLevel = level;
    bool leveledUp = false;

    while (true) {
      int needed = xpForLevel(currentLevel);
      if (currentXP >= needed) {
        currentXP -= needed;
        currentLevel++;
        leveledUp = true;
      } else {
        break;
      }
    }

    await setXP(currentXP);
    await setLevel(currentLevel);

    if (leveledUp) {
      await addActivity('level_up', 'Reached Level $currentLevel');
    }
  }

  List<String> get unlockedAchievementsIds {
    return prefs.getStringList('unlockedAchievements') ?? [];
  }

  Future<void> unlockAchievement(String id, String title) async {
    final list = unlockedAchievementsIds;
    if (!list.contains(id)) {
      list.add(id);
      await prefs.setStringList('unlockedAchievements', list);
      await addActivity('achievement', 'Unlocked "$title"');
      await addXP(300);
    }
  }

  List<Map<String, dynamic>> get recentActivity {
    final raw = prefs.getStringList('recentActivity') ?? [];
    return raw.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  Future<void> addActivity(String type, String description) async {
    final list = recentActivity;
    final item = {
      'type': type,
      'description': description,
      'timestamp': DateTime.now().toIso8601String(),
    };
    list.insert(0, item);
    if (list.length > 50) {
      list.removeLast();
    }
    final encoded = list.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('recentActivity', encoded);
  }
}