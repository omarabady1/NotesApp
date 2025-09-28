import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            action: CustomIcon(icon: Icons.check, onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(label: 'Title'),
                SizedBox(height: 16),
                CustomTextFormField(label: 'Content', maxLines: 9),
                SizedBox(height: 32),
                CustomButton(label: 'Update', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
