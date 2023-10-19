import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key, required this.ctx});

  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        'Please input a Title and select a Date in order to save your note.',
      ),
      title: const Text(
        'Missing Elements!',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: const Text('Okay!'),
        ),
      ],
    );
  }
}
