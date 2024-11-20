import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/add_note_widget.dart';
import 'package:notes_app/widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.search),
        //     style: ButtonStyle(
        //       shape: WidgetStateProperty.all(
        //         const RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(10),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 5,
        //   ),
        // ],
      ),
      body: BlocBuilder<ShowNotesCubit, ShowNotesState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<ShowNotesCubit>(context).notes ?? [];
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: NoteWidget(
                noteModel: notes[index],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) => const AddNoteWidget());
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
