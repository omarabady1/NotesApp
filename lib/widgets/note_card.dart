import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../cubits/notes_cubit/notes_cubit.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key, required this.cardColor, required this.note});

  final Color cardColor;
  final NoteModel note;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, left: 22, bottom: 20),
      child: Slidable(
        key: ValueKey(widget.note.key),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                widget.note.delete();
                BlocProvider.of<NotesCubit>(context).fetchNotes();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(16),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              EditNoteView.id,
              arguments: widget.note,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    widget.note.title,
                    style: const TextStyle(fontSize: 24, color: Colors.black87),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      widget.note.content,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    size: 32,
                    color: Colors.black.withValues(alpha: 0.8),
                  ),
                ),
                Text(
                  DateFormat('EEE, d/M/y').add_jm().format(widget.note.date),
                  style: TextStyle(color: Colors.black.withValues(alpha: 0.45)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
