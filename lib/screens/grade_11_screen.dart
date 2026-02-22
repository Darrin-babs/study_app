import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'subject_screen.dart';

class Grade11Screen extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {'name': 'Math', 'icon': Iconsax.math},
    {'name': 'English', 'icon': Iconsax.book},
    {'name': 'Science', 'icon': Iconsax.activity},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xFF202020), Color(0xFF121212)],
          radius: 1.2,
          center: Alignment(0, -0.4),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Grade 11',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose a subject',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: subjects.length,
                  separatorBuilder: (_, __) => SizedBox(height: 26),
                  itemBuilder: (context, index) {
                    final subject = subjects[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubjectScreen(
                              subjectName: subject['name'],
                              grade: 11,
                            ),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 180),
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            colors: [Color(0xFF9FD9FF), Color(0xFF6AB8F7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF6AB8F7).withOpacity(0.45),
                              blurRadius: 26,
                              offset: Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(subject['icon'], size: 56, color: Colors.black87),
                              SizedBox(height: 14),
                              Text(
                                subject['name'],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}