import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SubjectScreen extends StatefulWidget {
  final String subjectName;
  final int grade;

  const SubjectScreen({
    required this.subjectName,
    required this.grade,
  });

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  bool showAnswer = false;

  String get question {
    if (widget.grade == 9) {
      if (widget.subjectName == 'Math') return 'What is 8 × 7?';
      if (widget.subjectName == 'English') return 'What is a synonym for “happy”?';
      return 'What gas do plants release during photosynthesis?';
    }

    if (widget.grade == 10) {
      if (widget.subjectName == 'Math') return 'What is the slope of a line that rises 10 and runs 5?';
      if (widget.subjectName == 'English') return 'Identify the literary device: “The wind whispered.”';
      return 'What part of the cell contains DNA?';
    }

    if (widget.grade == 11) {
      if (widget.subjectName == 'Math') return 'What is the derivative of 3x²?';
      if (widget.subjectName == 'English') return 'What is the theme of a story?';
      return 'What is Newton’s Second Law?';
    }

    if (widget.grade == 12) {
      if (widget.subjectName == 'Math') return 'Evaluate the limit: lim (x→∞) (5x + 2) / x';
      if (widget.subjectName == 'English') return 'Define “existentialism” in literature.';
      return 'What is the function of mitochondria?';
    }

    return '';
  }

  String get answer {
    if (widget.grade == 9) {
      if (widget.subjectName == 'Math') return '56';
      if (widget.subjectName == 'English') return 'Joyful';
      return 'Oxygen';
    }

    if (widget.grade == 10) {
      if (widget.subjectName == 'Math') return 'Slope = 10/5 = 2';
      if (widget.subjectName == 'English') return 'Personification';
      return 'The nucleus';
    }

    if (widget.grade == 11) {
      if (widget.subjectName == 'Math') return '6x';
      if (widget.subjectName == 'English') return 'The central message or lesson';
      return 'F = m × a';
    }

    if (widget.grade == 12) {
      if (widget.subjectName == 'Math') return '5';
      if (widget.subjectName == 'English') return 'A philosophy exploring meaning and existence';
      return 'Energy production';
    }

    return '';
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
              padding: EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                    blurRadius: 28,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.lamp_charge, size: 40, color: Colors.black87),
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