import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
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
  } // UPDATE!! let this screen rather take a function as parameter through
  // which the Navigator will be present.

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  DateTime? _choosenDate;

  @override
  void dispose() {
    setState(
      () {
        _titleController.dispose();
        _contentController.dispose();

        super.dispose();
      },
    );
  }

  void _showDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate =
        DateTime(initialDate.year, initialDate.month, initialDate.day);
    final lastDate = DateTime(2030);

    final selectDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(
      () {
        _choosenDate = selectDate;
      },
    );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _choosenDate == null
                        ? 'No Date Selected'
                        : dateFormat.format(_choosenDate!),
                  ),
                  IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(fontSize: 30),
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(fontSize: 20),
                controller: _contentController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Content',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    hintText: 'Note Content'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_titleController.text);
          print(_contentController.text);
        },
        child: Icon(
          Icons.check,
          size: 40,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
