

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grammar_updated/app/util/consts/level_contents.dart';
import 'package:grammar_updated/domain/controllers/controller.dart';
import 'package:grammar_updated/presentation/pages/lessons/lesson.dart';

import '../../../domain/widgets/head.dart';


class LessonsList extends StatelessWidget {
  LessonsList({Key? key}) : super(key: key);


  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back), color: Colors.blue),
          actions: [IconButton(onPressed: (){

          }, icon: const Icon(Icons.alarm), color: Colors.blue,)],
          title: Align(
              alignment: Alignment.centerRight,
              child: Text('${argument['title']} ${argument['subtitle']}' ,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
          ),
      ),
      body: Column(
        children: [
          Level(
            colorOfContainer: argument['cardColor'],
            colorOfUnselectedProgress: argument['unSelectedProgressColor'],
            title: argument['title'],
            subtitle: argument['subtitle'],
            colorOfSubtitle: argument['subtitleColor'],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (c,i){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 7),
                    child: ListTile(
                      onTap: (){
                          Get.to(LessonScreen());
                      },
                      focusColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: argument['TileBorderColor'],  width:1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text('درس $i',
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      subtitle: Align(
                        alignment: Alignment.bottomRight,
                        child: Text('Subject',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      tileColor: Colors.transparent,
                      leading: Obx(()=> Checkbox(
                              value: homeCtrl.isLessonActive.value,
                              onChanged: (value){
                                homeCtrl.toggleActiveLesson();
                                print(value);
                                },
                          shape: CircleBorder(),
                            fillColor: MaterialStatePropertyAll(argument['TileBorderColor']) ,
                          ),
                      ),
                      // leading: Radio(
                      //   value: true,
                      //   groupValue:true,
                      //   onChanged: (value){},
                      //   activeColor: argument['TileBorderColor'], ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

