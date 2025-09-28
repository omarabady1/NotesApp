import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'note_card.dart';

class NotesListView extends StatelessWidget {
   NotesListView({
    super.key,
  });

  final List<Color> cardColors = [
    Color(0xffc18914),
    Color(0xff72b316),
    Color(0xff7e14bc),
    Color(0xff9a0c88),
    Color(0xff10a18c),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return NoteCard( cardColor: cardColors[index %  cardColors.length],);
      },
    );
  }
}
