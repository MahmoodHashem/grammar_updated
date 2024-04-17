

//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {

  TextEditingController _controller = TextEditingController();


  List languagesFromList = ['Persian', ' English', 'Pashto', 'Arabic'];
  String selectedFromLanguage = 'Persian';



  DropdownButton fromLanguageDropdown() {
    setState(() {

    });
    List<DropdownMenuItem<String>> dropdown = [];
    for (int i = 0; i < languagesFromList.length; i++) {
      String langauge = languagesFromList[i];
      var myDropdown = DropdownMenuItem(
        value: langauge,
        child: Text(langauge),
      );
      dropdown.add(myDropdown);
    }
    return DropdownButton(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        underline: const SizedBox(),
        value: selectedFromLanguage,
        items: dropdown,
        onChanged: (value) {
          setState(() {
            selectedFromLanguage = value;
          });
        });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
          elevation: 0,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'دیکشنری آنلاین ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back, color: Colors.blue.shade800,)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB( 8,32,8,5),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                        child: fromLanguageDropdown()),
                    Expanded(
                      child: Text('متن مورد نظر تان را اینجا وارد کنید',
                      textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.blue.shade600,
                    width: 1,
                  )
                ),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 16
                  ),
                  cursorHeight: 25,
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  textDirection: TextDirection.rtl,
                  maxLines: null,
                ),
              ),
             TextButton(
               style: const ButtonStyle(
                 overlayColor: MaterialStatePropertyAll(Colors.transparent)
               ),
                 onPressed: (){
                 setState(() {
                      });
              }, child: Text("Translate",
                style: TextStyle(
                  fontFamily: 'LEMON MILK Pro FTR Medium',
                  color: Colors.blue.shade800,
                  fontSize: 24
                ),
              ),
             ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          underline: const SizedBox(),
                            value: 'Persian',
                            items: [
                              DropdownMenuItem(child: Text("Persian"), value: 'Persian'),
                              DropdownMenuItem(child: Text("English"), value: 'English'),
                            ],
                            onChanged: (value) {
                              setState(() {
                              });
                            })),
                    Text('ترجمه',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical:8 ),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.blue.shade600,
                      width: 1,
                    )
                ),
                child: const Text('Translated'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

