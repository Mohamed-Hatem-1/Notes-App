import 'package:flutter/material.dart';
import 'package:notes_app/widgets/button_widget.dart';
import 'package:notes_app/widgets/text_field_widget.dart';

class AddNoteWidget extends StatelessWidget {
  const AddNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              hint: 'Title',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              hint: 'Description',
              maxLines: 5,
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(text: 'Add'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
