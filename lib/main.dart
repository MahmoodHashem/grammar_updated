
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grammar_updated/splash_screen.dart';

import 'data/storage/service.dart';
import 'domain/binding.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily:'Estedad',
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
