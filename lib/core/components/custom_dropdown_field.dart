import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String label;
  final String? placeholder;
  final void Function(T?)? onChanged;
  final Widget? prefixIcon;
  final double borderRadius;
  final EdgeInsets? contentPadding;

  // ignore: use_key_in_widget_constructors
  const CustomDropdownField({
    required this.value,
    required this.items,
    required this.label,
    this.placeholder,
    this.onChanged,
    this.prefixIcon,
    this.borderRadius = 16.0,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12.0),
        DropdownButtonFormField<T>(
          value: value,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            hintText: placeholder ?? 'Pilih $label',
            filled: true,
            fillColor: const Color(0xFFF3F3ED),
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}
