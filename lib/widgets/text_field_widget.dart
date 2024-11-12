import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  Function(String)? onChanged;
  int? maxLines;

  TextFieldWidget({
    super.key,
    required this.hint,
    required this.onChanged,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines == null ? 1 : maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Color(0xff53EBD6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
