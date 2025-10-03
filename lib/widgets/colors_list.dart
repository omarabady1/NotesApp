import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

final List<Color> colorsList = [
  Color(0xff984645),
  Color(0xfff4b9b8),
  Color(0xff85d2d0),
  Color(0xff887bb0),
  Color(0xffeeb5eb),
  Color(0xffc26dbc),
  Color(0xffc8f4f9),
  Color(0xff3cacae),
  Color(0xff059dc0),
];

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;
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
                BlocProvider.of<AddNoteCubit>(context).color =
                    colorsList[index];
              });
            },
            child: ColorItem(
              isSelected: index == currentIndex,
              color: colorsList[index],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 6),
        itemCount: colorsList.length,
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: CircleAvatar(radius: 25, backgroundColor: color),
          )
        : CircleAvatar(radius: 28, backgroundColor: color);
  }
}
