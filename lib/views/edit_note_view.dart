import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_list_view.dart';
import 'package:notes_app/widgets/text_form_field_widget.dart';

class EditNoteView extends StatefulWidget {
  static const String routeName = '/edit-note';
  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    NoteModel noteModel =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormFieldWidget(
              hint: noteModel.title,
              onSaved: (value) {},
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormFieldWidget(
              hint: noteModel.content,
              onSaved: (value) {},
              maxLines: 5,
              onChanged: (value) {
                content = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            EditNoteColorsListView(
              note: noteModel,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteModel.title = title ?? noteModel.title;
          noteModel.content = content ?? noteModel.content;
          noteModel.save();
          BlocProvider.of<ShowNotesCubit>(context).fetchNotes();
          Navigator.of(context).pop();
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.check),
      ),
    );
  }
}
