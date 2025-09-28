import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_search_icon.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Notes', action: CustomIcon(icon: Icons.search, onPressed: (){},),),
        Expanded(
          child: NotesListView(),
        ),
      ],
    );
  }
}


