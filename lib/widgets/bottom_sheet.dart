import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit.dart';
import 'add_note_form.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 24),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if(state is AddNoteFailure)
            {
              debugPrint(state.errorMessage);
            }
          if(state is AddNoteSuccess)
            {
              Navigator.pop(context);
            }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: BottomSheet(
              onClosing: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        //bottom: MediaQuery.of(context).viewInsets.bottom,
                        top: 18,
                      ),
                      child: AddNoteForm(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
