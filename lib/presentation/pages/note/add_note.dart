
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grammar_updated/data/models/note.dart';

import '../../../domain/controllers/controller.dart';
import '../../../domain/widgets/text_field.dart';
import 'package:intl/intl.dart';

class AddNote extends StatelessWidget {


  final homeCtrl = Get.find<HomeController>();

  AddNote({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String titleText = homeCtrl.titleEdtCtrl.text;
    String contentText = homeCtrl.detailsEdtCtrl.text;
    var response = Get.arguments;
    if(response != null){
      homeCtrl.titleEdtCtrl.text = response['title'];
      homeCtrl.detailsEdtCtrl.text = response['details'];
      homeCtrl.selectedNote.value = homeCtrl.notes[response['index']];
    }

    return WillPopScope(
      onWillPop: ()async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text('نوت جدید ',
              style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.bold,

              ),),
            centerTitle: true,
            leading: IconButton(onPressed: (){
              homeCtrl.titleEdtCtrl.clear();
              homeCtrl.detailsEdtCtrl.clear();
              Get.back();
            }, icon: const Icon(Icons.arrow_back), color: Colors.blue.shade800),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoDirection(
                    text: titleText,
                    child: AppTextField(
                          autoFocus: true,
                          size: 30,
                          hint: 'عنوان',
                         controller: homeCtrl.titleEdtCtrl,
                          textInput: TextInputType.multiline, ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: (){
                          homeCtrl.activeFocusNode();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 18),
                          child: SingleChildScrollView(
                              // reverse: true,
                              child: AppTextField(
                                  size: 18,
                                  focusNode: homeCtrl.specialFocusNode.value,
                                  hint: 'جزئیات....',
                                 controller:  homeCtrl.detailsEdtCtrl,
                                  textInput: TextInputType.multiline,
                                ),
                              ),
                          ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(onPressed: (){
                        final note = Note(title: homeCtrl.titleEdtCtrl.text, details:homeCtrl.detailsEdtCtrl.text);

                        if(response != null ){
                          homeCtrl.updateNote(note);
                        }else{
                          homeCtrl.addNote(note);
                        }
                        Get.back();
                        homeCtrl.titleEdtCtrl.clear();
                        homeCtrl.detailsEdtCtrl.clear();
                      }, child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                      MaterialButton(onPressed: (){
                        homeCtrl.titleEdtCtrl.clear();
                        homeCtrl.detailsEdtCtrl.clear();
                        Get.back();
                      }, child: const Text("Cancel", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),)
                    ],
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
