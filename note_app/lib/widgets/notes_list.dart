import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/widgets/notes_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    required this.onRegistered,
    required this.onDismiss,
    super.key,
  });

  final List<NotesModel> onRegistered;
  final void Function(NotesModel note) onDismiss;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: onRegistered.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.error),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete,
                  size: 35,
                  color: Colors.black,
                ),
                Spacer(),
                Icon(
                  Icons.delete,
                  size: 35,
                  color: Colors.black
                ),
              ],
            ),
          ),
          key: ValueKey(index),
          onDismissed: (direction) {
            onDismiss(onRegistered[index]);
            DismissDirection.vertical;
          },
          child: NoteCard(
            note: onRegistered[index],
          ),
        );
      },
    );
  }
}
