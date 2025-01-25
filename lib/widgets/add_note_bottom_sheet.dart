import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: const Column(
          children: [
            SizedBox(height: 20),
            CustomTextField(hint: 'Title'),
            SizedBox(height: 20),
            CustomTextField(
              hint: 'Content',
              maxLines: 5,
            ),
            SizedBox(height: 20),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
