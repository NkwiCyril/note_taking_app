import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/widgets/alert_dialog.dart';
import 'package:note_app/widgets/categories_bar.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key, required this.registeredNote});

  final void Function(NotesModel note) registeredNote;

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
  Category categoryIcon = Category.idea;

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

  // function to display date picker
  void _showDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(
      initialDate.year - 2,
      initialDate.month,
      initialDate.day,
    );
    final lastDate = DateTime(
      initialDate.year + 5,
    );

    final selectDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(
      () {
        // get the date selected by the user
        _choosenDate = selectDate;
      },
    );
  }

  void _choosenIcon(Category iconChoosen) {
    setState(() {
      categoryIcon = iconChoosen;
    });
  }

  // function to check input of all fields; whether all fields are filled
  void _checkAndAddNote() {
    if (_choosenDate == null || _titleController.text.isEmpty) {
      // show an alert on the screen if user does not input a title and select a date
      showDialog(
        context: context,
        builder: (ctx) {
          return Alert(ctx: ctx);
        },
      );
    } else {
      widget.registeredNote(
        NotesModel(
          title: _titleController.text,
          content: _contentController.text,
          category: categoryIcon,
          date: _choosenDate!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Note',
          style: TextStyle(
            fontSize: 25.1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
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
        child: Column(
          // scroll view for the notes if they are long
          children: [
            const SizedBox(
              height: 10,
            ),
            CategoryBar(
              onSelectCategory: _choosenIcon,
            ),
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
                ),
              ],
            ),
            SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      controller: _titleController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(fontSize: 30),
                      ),
                    ),
                    TextField(
                      style: const TextStyle(fontSize: 20),
                      controller: _contentController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something here.',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _checkAndAddNote();
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
