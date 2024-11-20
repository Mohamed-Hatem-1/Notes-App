import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 15,
            ),
          ),
          shape: MaterialStateProperty.all(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Color(0xff53EBD6)),
        ),
        child: isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Text(text),
      ),
    );
  }
}
