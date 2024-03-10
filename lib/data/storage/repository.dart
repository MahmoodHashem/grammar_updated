

import 'package:grammar_updated/data/providers/note_provider.dart';

import '../models/note.dart';

class NoteRepository{

  NoteProvider noteProvider;

  NoteRepository({required this.noteProvider});

  List<Note> read() => noteProvider.readTask();

  void write(List<Note> notes) => noteProvider.writeTask(notes);


}