import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/screens/create_note_screen.dart';
import 'package:note_app/widgets/notes_list.dart';

class NotesDisplayScreen extends StatefulWidget {
  const NotesDisplayScreen({super.key});

  @override
  State<NotesDisplayScreen> createState() {
    return _NotesDisplayScreenState();
  }
}

class _NotesDisplayScreenState extends State<NotesDisplayScreen> {
  final List<NotesModel> _registeredNotes = [];

  void _addNote(NotesModel note) {
    setState(() {
      _registeredNotes.add(note);
    });

  }

  void _gotoAddNote(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return CreateNoteScreen(
            registeredNote: _addNote
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget noList = Center(
      child: Text(
        'Get started by clicking the add button above.',
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );

    final Widget screenContent = _registeredNotes.isEmpty
        ? noList
        : NotesList(onRegistered: _registeredNotes);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _gotoAddNote(context);
            },
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                constraints: BoxConstraints.loose(const Size(400, 50)),
                prefixIconColor: Theme.of(context).colorScheme.primary,
                fillColor: Colors.grey.shade400,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: screenContent,
          ),
        ],
      ),
    );
  }
}
