import 'package:flutter/material.dart';

class GradeSelector extends StatelessWidget {
  final int itemCount;
  final ValueChanged<int>? onSelected;
  final int selected;

  const GradeSelector({
    Key? key,
    this.itemCount = 12,
    this.onSelected,
    this.selected = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final grade = index + 1;
          final isSelected = grade == selected;
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text('Grade $grade'),
              selected: isSelected,
              onSelected: (sel) {
                if (sel) onSelected?.call(grade);
              },
              selectedColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: isSelected ? 4 : 2,
            ),
          );
        },
      ),
    );
  }
}