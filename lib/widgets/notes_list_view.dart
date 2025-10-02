import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_card.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});

  final List<Color> cardColors = [
    Color(0xffc18914),
    Color(0xff72b316),
    Color(0xff7e14bc),
    Color(0xff9a0c88),
    Color(0xff10a18c),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NoteCard(
              cardColor: cardColors[index % cardColors.length],
              note: notes[index],
            );
          },
        );
      },
    );
  }
}
