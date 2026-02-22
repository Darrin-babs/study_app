import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SubjectScreen extends StatefulWidget {
  final String subjectName;

  const SubjectScreen({required this.subjectName});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  bool showAnswer = false;

  String get question {
    if (widget.subjectName == 'Math') {
      return 'What is 8 × 7?';
    } else if (widget.subjectName == 'English') {
      return 'What is a synonym for “happy”?';
    } else {
      return 'What gas do plants release during photosynthesis?';
    }
  }

  String get answer {
    if (widget.subjectName == 'Math') {
      return '56';
    } else if (widget.subjectName == 'English') {
      return 'Joyful';
    } else {
      return 'Oxygen';
    }
  }

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
            widget.subjectName,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showAnswer = !showAnswer;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                    blurRadius: 28,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Iconsax.lamp_charge,
                    size: 40,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 16),
                  Text(
                    question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: showAnswer ? 60 : 0,
                    margin: EdgeInsets.only(top: showAnswer ? 20 : 0),
                    child: Opacity(
                      opacity: showAnswer ? 1 : 0,
                      child: Center(
                        child: Text(
                          answer,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}