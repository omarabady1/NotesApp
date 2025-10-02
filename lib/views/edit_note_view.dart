import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key});
  static String id = 'EditNote';


  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late NoteModel note;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    titleController.text = note.title;
    contentController.text = note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              action: CustomIcon(
                icon: Icons.check,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    note.title = titleController.text;
                    note.content = contentController.text;
                    note.save();
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
                    Navigator.pop(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    label: 'Title',
                    controller: titleController,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    label: 'Content',
                    maxLines: 9,
                    controller: contentController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
