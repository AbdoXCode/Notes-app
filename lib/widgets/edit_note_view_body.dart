import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title,content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: (){
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),

          const SizedBox(
            height: 16,
          ),
          CustomTextField(hint: widget.note.title,onChanged: (value){
            title = value;
          },),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: widget.note.content,
            onChanged: (value){
              content = value;
            },
            maxLines: 5,
          )
        ],
      ),
    );
  }
}
