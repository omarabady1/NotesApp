import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note_model.dart';
import '../constants.dart';
import 'colors_list.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.note.color = kColorsList[index].toARGB32();
              });
            },
            child: ColorItem(
              isSelected: index == currentIndex,
              color: kColorsList[index],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 6),
        itemCount: kColorsList.length,
      ),
    );
  }
}
