import 'package:flutter/material.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/colors.dart';
import 'spaces.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool showLabel;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool isDescription;
  final double borderRadius;
  final EdgeInsets? contentPadding;

  // ignore: use_key_in_widget_constructors
  const CustomTextField({
    required this.controller,
    required this.label,
    this.placeholder,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.showLabel = true,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.isDescription = false,
    this.borderRadius = 16.0,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: AppColors.subHeadingColor,
            ),
          ),
          const SpaceHeight(12.0),
        ],
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: obscureText
              ? 1
              : null, // Set maxLines to 1 only when obscureText is true
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            hintText: placeholder ?? 'Masukkan $label',
            filled: true,
            fillColor: AppColors.textfieldBackgroundColor,
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}
