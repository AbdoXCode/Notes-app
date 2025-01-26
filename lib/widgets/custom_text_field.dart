import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1, this.onSaved});

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter some text';
        }else{
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        focusedBorder: buildBorder(),
        hintStyle: const TextStyle(
          color: Colors.white
        )
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      );
  }
}
