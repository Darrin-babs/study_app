import 'package:flutter/material.dart';

class GradeSelector extends StatefulWidget {
  @override
  State<GradeSelector> createState() => _GradeSelectorState();
}

class _GradeSelectorState extends State<GradeSelector> {
  int selected = 9;
  final List<int> grades = [9, 10, 11, 12];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: grades.map((g) {
          final bool isSelected = g == selected;
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = g;
              });
            },
            child: AnimatedScale(
              scale: isSelected ? 1.12 : 0.92,
              duration: Duration(milliseconds: 180),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 180),
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            Color(0xFF8ED081),
                            Color(0xFF6CC76A),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Color(0xFF3A3A3A),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Color(0xFF6CC76A).withOpacity(0.7),
                            blurRadius: 20,
                            offset: Offset(0, 6),
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    g.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}