
import 'package:get/get.dart';

import '../../data/models/note.dart';
import '../../data/storage/repository.dart';

class HomeController extends GetxController{

  NoteRepository noteRepository;

  HomeController({required this.noteRepository});

  List<Note> notes = <Note>[].obs;
  var activePage = 0.obs;


  void changeActivePage(int index){
    activePage.value = index;
  }


}