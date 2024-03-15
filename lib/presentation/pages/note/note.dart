
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/controller.dart';
import '../drawer/view.dart';
import 'add_note.dart';


class NotePage extends StatelessWidget {

  final homeCtrl = Get.find<HomeController>();

  //NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar:  AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(13, 71, 161, 1.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back), color: Colors.blue.shade800),
          title: const Align(
              alignment: Alignment.centerRight,
              child: Text(" نوت های من ",
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
          )
      ),
      body: Obx(()=>  homeCtrl.notes.isEmpty? const Center(child: Text('نوت اضافه کنید', style: TextStyle(fontSize: 25),),):ListView.builder(
            itemCount: homeCtrl.notes.length,
            itemBuilder: (b,i){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      right: BorderSide(
                        color: Colors.orange,
                        width: 4,
                      ),
                      left: BorderSide(
                        color: Colors.orange,
                        width: 0.5,
                      ),
                      top: BorderSide(
                        color: Colors.orange,
                        width: 0.5,
                      ),
                      bottom: BorderSide(
                        color: Colors.orange,
                        width: 0.5,
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(homeCtrl.notes[i].title,
                                  style: TextStyle(
                                    color: Colors.blue.shade800,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(homeCtrl.notes[i].details,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                              homeCtrl.deleteNote(homeCtrl.notes[i]);

                            },
                                icon: Icon(Icons.delete_outline_outlined, color: Colors.blue.shade800,)),
                            IconButton(onPressed: (){
                              Get.to(AddNote(),
                                  arguments: {
                                    'title': homeCtrl.notes[i].title,
                                    'details': homeCtrl.notes[i].details,
                                    'index': i,
                                  }
                              );
                            },
                                icon: Icon(Icons.edit_outlined,
                                    color: Colors.blue.shade800),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        Get.to(AddNote(
        ),
        transition: Transition.downToUp,
        );
      }, child: Icon(Icons.add),
      ),

    );
  }
}
