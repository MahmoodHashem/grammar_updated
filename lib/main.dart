

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grammar_updated/domain/widgets/head.dart';
import 'package:grammar_updated/presentation/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
