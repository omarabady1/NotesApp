import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validate,
    this.onSubmit,
    this.suffixIcon,
    required this.label,
    this.prefixIcon,
    this.onChanged,
    this.controller,
    this.maxLines = 1,
  });
  final String label;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmit;
  final FormFieldValidator<String?>? validate;
  final TextEditingController? controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: null,
      maxLines: maxLines,
      controller: controller,
      onFieldSubmitted: onSubmit,
      validator: validate,
      onChanged: onChanged,
      //style: TextStyle(color: kSecondaryColor),
      cursorColor: Color(0xff728582),
      decoration: InputDecoration(

        labelText: label,
        //hintText: 'Enter your password',
        //hintStyle: const TextStyle(color: Color(0xff728582)),
        labelStyle: const TextStyle(color: Color(0xff728582)),
        floatingLabelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: isPassword,
      keyboardType: keyboardType,
    );
  }
}

String? defaultValidate(value) {
  if (value!.isEmpty) {
    return 'this field cannot be empty';
  }
  return null;
}
