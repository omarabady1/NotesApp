import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.cardColor, required this.note});
  final Color cardColor;
  final NoteModel note ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Container(
        padding: const EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 24),
        margin: const EdgeInsetsGeometry.only(right: 22, left: 22, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsetsGeometry.all(0),
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 24, color: Colors.black87),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.content,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  size: 32,
                  color: Colors.black.withValues(alpha: 0.8),
                ),
              ),
            ),
            Text(
              DateFormat('EEE, d/M/y').add_jm().format(note.date),
              style: TextStyle(color: Colors.black.withValues(alpha: 0.45)),
            ),
          ],
        ),
      ),
    );
  }
}
