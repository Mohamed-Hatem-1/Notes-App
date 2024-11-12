import 'package:flutter/material.dart';
import 'package:notes_app/widgets/text_field_widget.dart';

class EditNoteView extends StatelessWidget {
  static const String routeName = '/edit-note';
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFieldWidget(hint: 'Title', onChanged: (value) {}),
            SizedBox(
              height: 15,
            ),
            TextFieldWidget(
                hint: 'Description', onChanged: (value) {}, maxLines: 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
        shape: CircleBorder(),
      ),
    );
  }
}
