

import 'package:get/get.dart';
import 'package:grammar_updated/data/providers/note_provider.dart';
import 'package:grammar_updated/data/storage/repository.dart';
import 'package:grammar_updated/domain/controllers/controller.dart';
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    
    Get.put(HomeController(noteRepository: NoteRepository(noteProvider: NoteProvider())),
    );
  }
}