import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {},
        child: Text(text),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
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
      ),
    );
  }
}
