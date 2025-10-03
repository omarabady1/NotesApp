import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(label: 'Title', controller: titleController),
          SizedBox(height: 16),
          CustomTextFormField(
            label: 'Content',
            maxLines: 5,
            controller: contentController,
          ),
          SizedBox(height: 24),
          ColorsList(),
          SizedBox(height: 24),
          CustomButton(
            label: 'Add',
            onTap: () {
              if (formKey.currentState!.validate()) {
                var note = NoteModel(
                  title: titleController.text,
                  content: contentController.text,
                  date: DateTime.now(),
                  color: BlocProvider.of<AddNoteCubit>(
                    context,
                  ).color.toARGB32(),
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
