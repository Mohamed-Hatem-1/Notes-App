import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel noteModel;
  const NoteWidget({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.routeName, arguments: noteModel);
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                noteModel.title,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                noteModel.content,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              trailing: IconButton(
                iconSize: 28,
                icon: Icon(
                  FontAwesomeIcons.trash,
                ),
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<ShowNotesCubit>(context).fetchNotes();
                },
              ),
              iconColor: Colors.black,
            ),
            Text(
              noteModel.date,
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
