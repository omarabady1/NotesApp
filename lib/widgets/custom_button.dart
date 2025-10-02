import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/custom_progress_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff350d70),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: SizedBox(
              height: 50,
              child: Center(
                child: (state is AddNoteLoading)
                    ? CustomProgressIndicator()
                    : Text('Add', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        );
      },
    );
  }
}
