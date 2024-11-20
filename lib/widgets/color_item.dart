import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const ColorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: color,
          );
  }
}
