import 'package:flutter/material.dart';

class GradeSelector extends StatefulWidget {
  final Function(int) onGradeSelected;

  const GradeSelector({required this.onGradeSelected});

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
        color: Color(0xFF1E1E1E).withOpacity(0.85),
        borderRadius: BorderRadius.circular(24),
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
              widget.onGradeSelected(g);
            },
            child: AnimatedScale(
              scale: isSelected ? 1.08 : 0.94,
              duration: Duration(milliseconds: 180),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 180),
                height: 56,
                width: 56,
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
                ),
                child: Center(
                  child: Text(
                    g.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
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