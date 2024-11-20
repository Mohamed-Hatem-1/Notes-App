import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';

class EditNoteColorsListView extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorsListView({super.key, required this.note});

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                _currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                isSelected: _currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
