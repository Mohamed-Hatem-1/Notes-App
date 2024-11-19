import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final int? maxLines;

  const TextFormFieldWidget({
    super.key,
    required this.hint,
    this.onSaved,
    this.maxLines,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines == null ? 1 : maxLines,
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
