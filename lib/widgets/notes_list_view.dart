import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final data = const [
    Color(0xffFFCC80),
    Color(0xff0019ff),
    Color(0xffb37d2b),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
          itemCount: data.length,
        padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: NoteItem(
                color: data[index],
              ),
            );
          }),
    );
  }
}
