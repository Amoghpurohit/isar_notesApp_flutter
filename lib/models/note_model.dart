
import 'package:isar/isar.dart';

part 'note_model.g.dart';

@collection           //to mark this class as a table in local
class Note{
  Id id = Isar.autoIncrement;     //gives a unique id to each obj

  @Index(type: IndexType.value)      //to index frequently accessed/queried attribues for faster search
  late String text;
}