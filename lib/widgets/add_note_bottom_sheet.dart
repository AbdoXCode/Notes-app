import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add%20note%20cubit/add_note_cubit.dart';
import '../cubits/notes/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteLoading) {
            isLoading = true;
          } else if (state is AddNoteSuccess) {
            isLoading = false;
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {
            isLoading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
