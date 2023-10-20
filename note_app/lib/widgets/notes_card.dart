import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        clipBehavior: Clip.none,
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              height: 12,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    note.title,
                    maxLines: 30,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    categoryIcons[note.category],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                note.content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                note.formattedDate,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
