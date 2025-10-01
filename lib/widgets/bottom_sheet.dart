import 'package:flutter/material.dart';

import 'add_note_form.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric( horizontal: 24, vertical: 24),
      child: BottomSheet(
        onClosing: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    //bottom: MediaQuery.of(context).viewInsets.bottom,
                  top: 18
                ),
                child: AddNoteForm(),
              ),
            ),
          );},
      ),
    );
  }
}

