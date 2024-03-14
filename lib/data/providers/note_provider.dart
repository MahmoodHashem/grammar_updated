import 'dart:convert';

import 'package:get/get.dart';

import '../../app/util/noteKey.dart';
import '../models/note.dart';
import '../storage/service.dart';


class NoteProvider{

  final _storage = Get.find<StorageService>();

  void writeTask(List<Note> notes){
    _storage.write(noteKey, jsonEncode(notes));
  }

  List<Note> readTask(){

    var notes = <Note>[];

    List x = jsonDecode(_storage.read(noteKey).toString());

    for (var element in x) {notes.add(Note.fromJson(element));}

    return notes;
  }



}