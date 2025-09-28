import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(label: 'Title'),
                    SizedBox(height: 16,),
                    CustomTextFormField(label: 'Content', maxLines: 5,),
                    SizedBox(height: 32,),
                    CustomButton(label: 'Add', onTap: (){

                    })
                  ],
                ),
              ),
            ),
          );},
      ),
    );
  }
}
