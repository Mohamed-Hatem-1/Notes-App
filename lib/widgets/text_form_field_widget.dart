import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final int? maxLines;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.hint,
    this.onSaved,
    this.maxLines,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines == null ? 1 : 5,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xff53EBD6),
        ),
        enabledBorder: border(),
        focusedBorder: border(),
        errorBorder: border(color: Colors.red),
        focusedErrorBorder: border(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder border({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
