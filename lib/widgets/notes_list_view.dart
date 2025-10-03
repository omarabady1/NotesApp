import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../constants.dart';
import 'note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return notes.isNotEmpty? ListView.builder(
          controller: listviewController,
          itemCount: notes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NoteCard(note: notes[index]);
          },
        ) : Center(
          child: Text('No Notes Yet', style: TextStyle(fontSize: 24, color: Colors.grey),),
        );
      },
    );
  }
}
