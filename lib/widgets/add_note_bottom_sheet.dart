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
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey= GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String?title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTextField(hint: 'Title',onSaved: (value){
            title = value;
          },),
          SizedBox(height: 20),
          CustomTextField(
            hint: 'Content',
            onSaved: (value){
              content = value;
            },
            maxLines: 5,
          ),
          SizedBox(height: 20),
          CustomButton(onPressed: (){
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
              print('Title: $title, Content: $content');
            }else{
              setState(() {
                autovalidateMode = AutovalidateMode.always;
                setState(() {

                });
              });
            }
          },),
        ],
      ),
    );
  }
}