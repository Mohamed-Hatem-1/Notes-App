import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/show_notes_cubit/show_notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form_state_widget.dart';

class AddNoteWidget extends StatelessWidget {
  const AddNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<ShowNotesCubit>(context).fetchNotes();
            Navigator.of(context).pop();
          }
          if (state is AddNoteFailure) {
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20),
              child: AddNoteFormStateWidget(),
            ),
          );
        },
      ),
    );
  }
}
