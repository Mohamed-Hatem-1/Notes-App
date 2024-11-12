import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_widget.dart';
import 'package:notes_app/widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/home';
  final colors = [
    Colors.orange,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.pink,
  ];
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: NoteWidget(
            color: colors[index % colors.length],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              // backgroundColor: ,
              context: context,
              builder: (context) => const AddNoteWidget());
        },
        child: const Icon(Icons.add),
        shape: CircleBorder(),
      ),
    );
  }
}
