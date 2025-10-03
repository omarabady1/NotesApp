import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

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
                    kColorsList[index];
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
