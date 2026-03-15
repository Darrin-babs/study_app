import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../services/storage_service.dart';

class RecentActivityScreen extends StatefulWidget {
  @override
  State<RecentActivityScreen> createState() => _RecentActivityScreenState();
}

class _RecentActivityScreenState extends State<RecentActivityScreen> {
  List<Map<String, dynamic>> activity = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    await StorageService.instance.init();
    setState(() {
      activity = StorageService.instance.recentActivity;
    });
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'quiz':
        return Iconsax.activity;
      case 'achievement':
        return Iconsax.medal_star;
      case 'level_up':
        return Iconsax.arrow_up_3;
      case 'study_tip':
        return Iconsax.lamp;
      case 'lesson':
        return Iconsax.book;
      case 'streak':
        return Iconsax.flash_1;
      default:
        return Iconsax.info_circle;
    }
  }

  String _timeLabel(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return '';
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} h ago';
    return '${diff.inDays} d ago';
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
            'Recent Activity',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: activity.isEmpty
            ? Center(
                child: Text(
                  'No activity yet.\nStart a quiz or view a tip.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                itemCount: activity.length,
                itemBuilder: (context, index) {
                  final item = activity[index];
                  final type = item['type'] as String;
                  final description = item['description'] as String;
                  final timestamp = item['timestamp'] as String;
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xFF1E1E1E).withOpacity(0.9),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF9FD9FF).withOpacity(0.18),
                          ),
                          child: Icon(
                            _iconForType(type),
                            size: 22,
                            color: Color(0xFF9FD9FF),
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                description,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.clock,
                                    size: 14,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    _timeLabel(timestamp),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
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