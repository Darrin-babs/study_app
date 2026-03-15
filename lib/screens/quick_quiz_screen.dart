import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../data/quiz_data.dart';
import '../data/achievement_data.dart';
import '../services/storage_service.dart';

class QuickQuizScreen extends StatefulWidget {
  @override
  State<QuickQuizScreen> createState() => _QuickQuizScreenState();
}

class _QuickQuizScreenState extends State<QuickQuizScreen> {
  final Random _random = Random();
  List<QuizQuestion> quizQuestions = [];
  int currentIndex = 0;
  int score = 0;
  int? selectedIndex;
  bool answered = false;
  bool showSummary = false;
  int correctStreak = 0;
  int quizzesCompleted = 0;

  @override
  void initState() {
    super.initState();
    _initQuiz();
  }

  Future<void> _initQuiz() async {
    await StorageService.instance.init();
    _buildRandomQuiz();
  }

  void _buildRandomQuiz() {
    final shuffled = List<QuizQuestion>.from(allQuizQuestions)..shuffle(_random);
    quizQuestions = shuffled.take(5).toList();
    currentIndex = 0;
    score = 0;
    selectedIndex = null;
    answered = false;
    showSummary = false;
    correctStreak = 0;
    setState(() {});
  }

  Future<void> _unlockById(String id) async {
    final ach = allAchievements.firstWhere(
      (a) => a.id == id,
      orElse: () => Achievement(id: id, title: id, description: '', xp: 0),
    );
    await StorageService.instance.unlockAchievement(ach.id, ach.title);
  }

  Future<void> _handleAnswer(int index) async {
    if (answered) return;
    final question = quizQuestions[currentIndex];
    final correctIndex = question.answerIndex;
    final isCorrect = index == correctIndex;

    setState(() {
      selectedIndex = index;
      answered = true;
      if (isCorrect) {
        score++;
        correctStreak++;
      } else {
        correctStreak = 0;
      }
    });

    await StorageService.instance.addXP(isCorrect ? 120 : 40);

    if (correctStreak == 3) {
      await _unlockById('correct_3_row');
    } else if (correctStreak == 5) {
      await _unlockById('correct_5_row');
    }

    if (question.subject == 'Math' && isCorrect) {
      await _unlockById('math_master');
    } else if (question.subject == 'Science' && isCorrect) {
      await _unlockById('science_focus');
    } else if (question.subject == 'English' && isCorrect) {
      await _unlockById('english_focus');
    }
  }

  Future<void> _finishQuiz() async {
    quizzesCompleted++;
    await StorageService.instance.addActivity(
      'quiz',
      'Completed a quick quiz: $score / ${quizQuestions.length}',
    );
    await _unlockById('first_quiz');
    if (score == quizQuestions.length) {
      await _unlockById('perfect_quiz');
    }
    if (quizzesCompleted >= 3) {
      await _unlockById('three_quizzes');
    }
    if (quizzesCompleted >= 10) {
      await _unlockById('ten_quizzes');
    }
    setState(() {
      showSummary = true;
    });
  }

  void _nextQuestion() {
    if (!answered) return;
    if (currentIndex < quizQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
        answered = false;
      });
    } else {
      _finishQuiz();
    }
  }

  void _restartQuiz() {
    _buildRandomQuiz();
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
            'Quick Quiz',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: showSummary ? _buildSummary() : _buildQuestion(),
        ),
      ),
    );
  }

  Widget _buildQuestion() {
    if (quizQuestions.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF9FD9FF)),
        ),
      );
    }
    final question = quizQuestions[currentIndex];
    final options = List<String>.from(question.options);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question ${currentIndex + 1} of ${quizQuestions.length}',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
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
                blurRadius: 26,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Iconsax.lamp_charge,
                size: 34,
                color: Colors.black87,
              ),
              SizedBox(height: 14),
              Text(
                question.question,
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
        SizedBox(height: 22),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final optionText = options[index];
              final isCorrect = index == question.answerIndex;
              final isSelected = index == selectedIndex;
              Color borderColor = Colors.white24;
              Color fillColor = Color(0xFF1E1E1E).withOpacity(0.9);
              Color textColor = Colors.white;

              if (answered && isSelected && isCorrect) {
                borderColor = Color(0xFF4CAF50);
                fillColor = Color(0xFF4CAF50).withOpacity(0.18);
                textColor = Colors.white;
              } else if (answered && isSelected && !isCorrect) {
                borderColor = Color(0xFFF44336);
                fillColor = Color(0xFFF44336).withOpacity(0.18);
                textColor = Colors.white;
              } else if (answered && isCorrect) {
                borderColor = Color(0xFF4CAF50);
                fillColor = Color(0xFF4CAF50).withOpacity(0.12);
                textColor = Colors.white;
              }

              return GestureDetector(
                onTap: () => _handleAnswer(index),
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: fillColor,
                    border: Border.all(color: borderColor, width: 1.2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: answered
                                ? (isCorrect ? Color(0xFF4CAF50) : Colors.white54)
                                : Colors.white38,
                            width: 1.4,
                          ),
                          color: isSelected
                              ? (isCorrect ? Color(0xFF4CAF50) : Colors.white24)
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            String.fromCharCode(65 + index),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          optionText,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: _nextQuestion,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
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
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Text(
                currentIndex == quizQuestions.length - 1 ? 'Finish Quiz' : 'Next Question',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    final total = quizQuestions.length;
    final percent = (score / total * 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
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
                blurRadius: 26,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                Iconsax.medal_star,
                size: 40,
                color: Colors.black87,
              ),
              SizedBox(height: 14),
              Text(
                'Quiz Complete',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'You scored $score out of $total',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.black87.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 6),
              Text(
                '$percent%',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 26),
        GestureDetector(
          onTap: _restartQuiz,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
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
                  blurRadius: 24,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'New Random Quiz',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}