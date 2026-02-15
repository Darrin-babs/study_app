import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/grade_selector.dart';
import '../widgets/progress_card.dart';

class HomeScreen extends StatelessWidget {
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
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                'Choose your grade',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              GradeSelector(),
              SizedBox(height: 32),
              ProgressCard(),
            ],
          ),
        ),
      ),
    );
  }
}