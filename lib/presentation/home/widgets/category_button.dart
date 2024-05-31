// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  CategoryButton({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(category,
          style: TextStyle(
              color: isSelected ? Colors.white : AppColors.backgroundColor)),
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? AppColors.backgroundColor : Colors.white,
      ),
    );
  }
}
