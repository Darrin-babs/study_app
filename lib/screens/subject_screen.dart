import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';
import 'grade_9_questions.dart';
import 'grade_10_questions.dart';
import 'grade11_questions.dart';
import 'grade_12_questions.dart';
import '../services/storage_service.dart';
import '../widgets/xp_toast.dart';

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
  late int index;
  int cardsSeen = 0;

  @override
  void initState() {
    super.initState();
    StorageService.instance.init();
    index = Random().nextInt(30);
  }

  void awardXP(int amount, String label) {
    StorageService.instance.addXP(amount);
    showXPToast(context, label);
  }

  void nextCard() {
    setState(() {
      showAnswer = false;
      index = Random().nextInt(30);
      cardsSeen++;

      awardXP(10, "+10 XP");

      if (cardsSeen % 20 == 0) {
        awardXP(50, "+50 XP — Milestone");
      }

      if (cardsSeen == 30) {
        awardXP(150, "+150 XP — Subject Complete");
      }
    });
  }

  String get question {
    if (widget.grade == 9) {
      if (widget.subjectName == 'Math') return Grade9Questions.math[index];
      if (widget.subjectName == 'English') return Grade9Questions.english[index];
      return Grade9Questions.science[index];
    }
    if (widget.grade == 10) {
      if (widget.subjectName == 'Math') return Grade10Questions.math[index];
      if (widget.subjectName == 'English') return Grade10Questions.english[index];
      return Grade10Questions.science[index];
    }
    if (widget.grade == 11) {
      if (widget.subjectName == 'Math') return Grade11Questions.math[index];
      if (widget.subjectName == 'English') return Grade11Questions.english[index];
      return Grade11Questions.science[index];
    }
    if (widget.grade == 12) {
      if (widget.subjectName == 'Math') return Grade12Questions.math[index];
      if (widget.subjectName == 'English') return Grade12Questions.english[index];
      return Grade12Questions.science[index];
    }
    return '';
  }

  String get answer {
    if (widget.grade == 9) {
      if (widget.subjectName == 'Math') return Grade9Questions.mathAnswers[index];
      if (widget.subjectName == 'English') return Grade9Questions.englishAnswers[index];
      return Grade9Questions.scienceAnswers[index];
    }
    if (widget.grade == 10) {
      if (widget.subjectName == 'Math') return Grade10Questions.mathAnswers[index];
      if (widget.subjectName == 'English') return Grade10Questions.englishAnswers[index];
      return Grade10Questions.scienceAnswers[index];
    }
    if (widget.grade == 11) {
      if (widget.subjectName == 'Math') return Grade11Questions.mathAnswers[index];
      if (widget.subjectName == 'English') return Grade11Questions.englishAnswers[index];
      return Grade11Questions.scienceAnswers[index];
    }
    if (widget.grade == 12) {
      if (widget.subjectName == 'Math') return Grade12Questions.mathAnswers[index];
      if (widget.subjectName == 'English') return Grade12Questions.englishAnswers[index];
      return Grade12Questions.scienceAnswers[index];
    }
    return '';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAnswer = !showAnswer;
                    if (showAnswer) awardXP(5, "+5 XP");
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
              SizedBox(height: 24),
              GestureDetector(
                onTap: nextCard,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width * 0.6,
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
                        blurRadius: 22,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Next Question',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
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
    );
  }
}