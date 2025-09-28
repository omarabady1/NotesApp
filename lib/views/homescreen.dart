import 'package:flutter/material.dart';
import 'package:notes_app/widgets/bottom_sheet.dart';
import '../widgets/notes_view_body.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff350d70),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom* 0.9,
                ),
                child: CustomBottomSheet(),
              );
            },
          );
        },
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
