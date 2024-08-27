import 'package:flutter/material.dart';
import 'package:isar_notes/widgets/note_popover.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;
  final String text;
  const NoteTile(
      {super.key,
      required this.text,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      margin: const EdgeInsets.only(top: 7, left: 18, right: 18, bottom: 4),
      child: ListTile(
        leading: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Builder(
          builder: (context) => IconButton(
            onPressed: () => showPopover(
              width: 100,
              height: 100,
              context: context,
              bodyBuilder: (context) => NotePopOver(
                onEdit: onEdit,
                onDelete: onDelete,
              ),
            ),
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
