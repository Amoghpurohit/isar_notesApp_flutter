import 'package:flutter/material.dart';

class NotePopOver extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;
  const NotePopOver({super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onEdit!();
          },
          child: const Text(
            'Edit',
            style: TextStyle(
                color: Colors.black,
                //Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onDelete!();
          },
          child: const Text(
            'Delete',
            style: TextStyle(
                color:  Colors.black,
                //Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
