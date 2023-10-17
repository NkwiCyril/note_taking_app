import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/widgets/notes_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({required this.onRegistered, super.key});

  final List<NotesModel> onRegistered;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: onRegistered.length,
      itemBuilder: (context, index) {
        return NoteCard(
          note: onRegistered[index],
        );
      },
    );
  }
}
