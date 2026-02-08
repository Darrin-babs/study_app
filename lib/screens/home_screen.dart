import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:study_app/widgets/app_bar.dart';
import 'package:study_app/widgets/grade_selector.dart';

class HomeScreen extends StatelessWidget {
  final List<int> grades = List.generate(12, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F0E8),
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            GradeSelector(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: grades.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final grade = grades[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.book,
                            size: 34,
                            color: Colors.black87,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Grade $grade',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
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
    );
  }
}