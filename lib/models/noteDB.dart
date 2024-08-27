
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_notes/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

class NoteDB extends ChangeNotifier {
  static late Isar isar;

  //initialize Isar

  static Future<void> initializeIsarDB() async {
    final dir = await getApplicationDocumentsDirectory();             //the path to the dir where the application might store/place the data
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  Future<void> addNote(String text) async {                //storing anything is db, we store the entire object in it, not just a text or a piece of info that we require
    final note = Note()..text = text;
    await isar.writeTxn(() => isar.notes.put(note),);          //we are writing to db but have to specify to which collection we are writing to and use .put(object) to store in db
    fetchNotes();
  }

  final List<Note> noteObjs = [];

  Future<void> fetchNotes() async {
    final list = await isar.notes.where().findAll();
    noteObjs.clear();
    noteObjs.addAll(list);
    notifyListeners();
  }

  Future<void> updateNote(int id, String text) async {
    final toUpdateText = await isar.notes.get(id);
    if(toUpdateText != null){
      toUpdateText.text = text;
      await isar.writeTxn(() => isar.notes.put(toUpdateText));
      fetchNotes();
      notifyListeners();
    }
  }

  Future<void> deleteNote(int id) async {
    //final toDeleteNote = await isar.notes.get(id);
    await isar.writeTxn(() => isar.notes.delete(id));
    fetchNotes();
    notifyListeners();
  }
  //func to add note, edit, read, delete note


}