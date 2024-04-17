


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grammar_updated/presentation/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  _navigatetohome()async{
    await Future.delayed(
        const Duration(seconds: 2));
   Get.off(()=> Home(), transition: Transition.zoom);
  }

  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this);
   _navigatetohome();
    super.initState();
    controller!.forward();
    controller!.addListener(() {
      setState(() {
      });
    });

  }

@override
  void dispose() {
    controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MGrammar', 
            style: TextStyle(
              fontSize: 40, 
              color: Color.fromRGBO(13, 71, 161, 1.0).withOpacity(controller!.value),
              fontFamily: 'LEMON MILK Pro FTR Medium',
            ),
            ),
            const Text('اِم گرامر',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            )),
            const Text('(مرجع معتبر گرامر زبان انگلیسی)' ,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),)
          ],
        ),
      )
    );
  }
}
