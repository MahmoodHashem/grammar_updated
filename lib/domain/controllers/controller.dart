
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/note.dart';
import '../../data/storage/repository.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController{

  NoteRepository noteRepository;

  HomeController({required this.noteRepository});

  List<Note> notes = <Note>[].obs;
  var activePage = 0.obs;
  var isLessonActive = false.obs;
  var titleEdtCtrl = TextEditingController();
  var detailsEdtCtrl = TextEditingController();
  var specialFocusNode = FocusNode().obs;
  var isRTL = false.obs;
  var isFocused = false.obs;
  final selectedNote = Rx<Note?>(null);




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    notes.assignAll(noteRepository.read());
    ever(notes as RxInterface<Object?>, (callback) => noteRepository.write(notes));

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    specialFocusNode.value.dispose();
  }

    void activeFocusNode(){
      specialFocusNode.value.requestFocus();
    }

  void changeActivePage(int index){
    activePage.value = index;
  }


 void toggleActiveLesson(){
    isLessonActive.value = !isLessonActive.value;
 }

 void addNote(Note note){
      notes.add(note);
 }

 void updateNote(Note note){

    var oldIndex = notes.indexOf(selectedNote.value!);
    notes[oldIndex] = note;

  }

 void deleteNote(Note note){
    notes.remove(note);
 }




}