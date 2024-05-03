

//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


class Dictionary extends StatefulWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  State<Dictionary> createState() => DictionaryState();
}


/// The [DictionaryState] class contains methods for creating dropdown buttons for selecting
/// the source and target languages, as well as methods for translating the text and
/// determining the text direction.

class DictionaryState extends State<Dictionary> {

  TextEditingController _controller = TextEditingController();


  List<String> languagesFromList = ['Persian', ' English', 'Pashto', 'Arabic'];
  String selectedFromLanguage = 'Persian';

  List<String> languagesToList = ['English', ' Persian', 'Pashto', 'Arabic'];
  String selectedToLanguage = 'English';

  String translated = '';


/// fromLanguageDropdown Creates a dropdown button for selecting the source language.
/// This method generates a [DropdownButton] widget populated with items from [languagesFromList].
/// Each item in the dropdown represents a language that can be selected as the source language.
/// When a language is selected, it updates the [selectedFromLanguage] state to reflect the new selection.
  DropdownButton fromLanguageDropdown() {   
    List<DropdownMenuItem<String>> dropdown = languagesFromList.map((language){
      return DropdownMenuItem(
        value:language, 
        child:Text(language), 
      ); 
    }).toList(); 
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



/// toLanguageDropdown Creates a dropdown button for selecting the target language.
/// This method generates a [DropdownButton] widget populated with items from [languagesToList].
/// Each item in the dropdown represents a language that can be selected as the target language.
/// When a language is selected, it updates the [selectedToLanguage] state to reflect the new selection.
  DropdownButton toLanguageDropdown() {
    List<DropdownMenuItem<String>> dropdown = languagesToList.map((langauge){
      return DropdownMenuItem(
        value: langauge,
        child: Text(langauge),
      );
    }).toList();
    return DropdownButton(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        underline: const SizedBox(),
        value: selectedToLanguage,
        items: dropdown,
        onChanged: (value) {
          setState(() {
            selectedToLanguage = value;
          });
        });
  }




/// The [toBeTranslated] method takes a [language] parameter and returns the corresponding language code.
/// It uses a switch statement to match the [language] parameter with a specific case and returns the corresponding language code.
/// If no match is found, it returns the default language code 'fa'.
/// The method is used to convert the selected language from the dropdown menu into a language code that can be used for translation.
  String toBeTranslated(String language){
    switch(language){
      case 'Persian': return 'fa';
      case 'English': return 'en';
      case 'Pashto': return 'ps';
      case 'Arabic': return 'ar';
      default:
        return 'fa';
    }
  }



/// The [_translateText] method is responsible for translating text from the selected source language to the selected target language. It takes two parameters: [text] (the text to be translated) and [to] (the target language code). 
/// Inside the method, it uses the [translate] method from the [translator] package to perform the translation. The [translate] method is called with the [from] language code (obtained from the [selectedFromLanguage] state) and the [to] language code (obtained from the [toBeTranslated] method). 
/// The translated text is stored in the [translated] variable, which is then returned by the method. 
/// Note: The method is asynchronous and returns a [Future], indicating that the translation may take some time to complete.
  Future<String> _translateText(String text, String to) async {
    await _controller.text.translate(from:toBeTranslated(selectedFromLanguage) ,to: toBeTranslated(selectedToLanguage)).then((value) {
      translated = value.text;
    });
    return translated;
  }

  bool direction(){
    return toBeTranslated(selectedToLanguage) != 'en'; 
   
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
              }, child: TextButton(onPressed: () async{
               setState(() {
               });
               await _translateText(_controller.text, toBeTranslated(selectedToLanguage));
             }, child:Text("Translate",
                style: TextStyle(
                  fontFamily: 'LEMON MILK Pro FTR Medium',
                  color: Colors.blue.shade800,
                  fontSize: 24
                ),
              ),
             )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                        child: toLanguageDropdown()),
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
                child: FutureBuilder(
                    future: _translateText(_controller.text, selectedToLanguage),
                    builder: (context,snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator()); // Show loading indicator
                      } else if (snapshot.hasError) {
                        return const Text('Something went wrong'); // Show error message
                      } else {
                        return Text("${snapshot.data}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textDirection: direction()?TextDirection.rtl:TextDirection.ltr,
                          maxLines: null,
                        );// Show translated text
                      }
                    },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

