import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar_notes/models/noteDB.dart';
import 'package:isar_notes/models/note_model.dart';
import 'package:isar_notes/widgets/drawer.dart';
import 'package:isar_notes/widgets/note_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteDB>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<NoteDB>();
    final listView = db.noteObjs;

    final textCont = TextEditingController();

    void onCreate() {
      showDialog(
        context: context,
        builder: (context) {
          textCont.clear();
          return AlertDialog(
            content: TextField(
              controller: textCont,
              decoration: const InputDecoration(hintText: 'Enter Your Note'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<NoteDB>().addNote(textCont.text);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Add Note',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ],
          );
        },
      );
    }

    void onEdit(Note note) {
      textCont.text = note.text;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: textCont,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<NoteDB>().updateNote(note.id, textCont.text);
                  textCont.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Save',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              ),
            ],
          );
        },
      );
    }

    void onDelete(int index) {
      context.read<NoteDB>().deleteNote(index);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // title: const Text('Notes App'),
        // centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary, //shows the inverse of the background (good for light and dark theme)
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        splashColor: Theme.of(context).colorScheme.primary,
        //shape: ShapeBorder.lerp(a, b, t),
        onPressed: onCreate,
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listView.length,
              itemBuilder: (context, index) {
                final note = listView[index];
                return NoteTile(
                  text: note.text,
                  onEdit: () {
                    onEdit(note);
                  },
                  onDelete: () {
                    onDelete(note.id);
                  },
                );
                // ListTile(
                //   title: Text(note.text),
                //   trailing: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       IconButton(
                //         onPressed: () {
                //           onEdit(note);
                //         },
                //         icon: const Icon(Icons.edit),
                //       ),
                //       IconButton(
                //         onPressed: () {
                //           onDelete(note.id);
                //         },
                //         icon: const Icon(Icons.delete),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
