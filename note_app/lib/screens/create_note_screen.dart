import 'package:flutter/material.dart';
import 'package:note_app/widgets/categories_bar.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  void _moveToNoteDisplayScreen() {
    // move pop the current screen from the screen stack
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Note',
          style: TextStyle(
            fontSize: 25.1,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              // button to cancel current session
              onPressed: _moveToNoteDisplayScreen,
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'cancel',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          // scroll view for the notes if they are long
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CategoryBar(),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(fontSize: 30),
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    hintText: 'Note Title'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Content',
                    labelStyle: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    hintText: 'Note Content'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.check,
          size: 40,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
