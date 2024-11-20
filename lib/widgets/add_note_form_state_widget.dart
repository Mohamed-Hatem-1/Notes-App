import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/button_widget.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/text_form_field_widget.dart';

class AddNoteFormStateWidget extends StatefulWidget {
  const AddNoteFormStateWidget({
    super.key,
  });

  @override
  State<AddNoteFormStateWidget> createState() => _AddNoteFormStateWidgetState();
}

class _AddNoteFormStateWidgetState extends State<AddNoteFormStateWidget> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String? title, desc;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormFieldWidget(
              hint: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              hint: 'Description',
              maxLines: 5,
              onSaved: (value) {
                desc = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ColorsListView(),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return ButtonWidget(
                  isLoading: state is AddNoteLoading ? true : false,
                  text: 'Add',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var date = DateTime.now();
                      var formattedDate =
                          DateFormat.yMd().add_jm().format(date);
                      var note = NoteModel(
                        title: title!,
                        content: desc!,
                        date: formattedDate,
                        color: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    } else {
                      _autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
