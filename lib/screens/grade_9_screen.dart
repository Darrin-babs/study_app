import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'subject_screen.dart';

class Grade9Screen extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'Math',
      'icon': Iconsax.math,
    },
    {
      'name': 'English',
      'icon': Iconsax.book,
    },
    {
      'name': 'Science',
      'icon': Iconsax.activity,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF202020),
            Color(0xFF121212),
          ],
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
            'Grade 9',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 18, top: 20),
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
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: subjects.length,
                  separatorBuilder: (_, __) => SizedBox(width: 18),
                  itemBuilder: (context, index) {
                    final subject = subjects[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubjectScreen(
                              subjectName: subject['name'],
                            ),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 180),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF8ED081),
                              Color(0xFF6CC76A),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF6CC76A).withOpacity(0.45),
                              blurRadius: 22,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              subject['icon'],
                              size: 48,
                              color: Colors.black87,
                            ),
                            SizedBox(height: 12),
                            Text(
                              subject['name'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ],
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