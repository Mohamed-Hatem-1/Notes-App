import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteWidget extends StatelessWidget {
  final Color color;
  const NoteWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                'This is a note ',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'this is a lot of information this is a lot of information this is a lot of information this is a lot of information this is a lot of information this is a lot of information this is a lot of information ',
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
                  // delete note
                },
              ),
              iconColor: Colors.black,
            ),
            Text(
              'May 21,2022',
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
