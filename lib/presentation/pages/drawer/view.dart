
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dictionary_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);

                },
                    icon:Icon(Icons.close, color: Colors.blue.shade800,) ),
              ),
              Container(
                height: 200,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MGrammar',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(13, 71, 161, 1.0),
                          fontFamily: 'LEMON MILK Pro FTR Medium',
                        ),
                      ),
                      Text('اِم گرامر',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                      Text('(مرجع معتبر گرامر زبان انگلیسی)' ,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: (){
                  Get.to(()=> Dictionary());
                },
                focusColor: Colors.grey,
                hoverColor: Colors.grey,
                selectedTileColor: Colors.grey,
                contentPadding: const EdgeInsets.only(left: 50, right: 50),
                title: const Align(
                  alignment: Alignment.centerRight,
                  child: Text("دیکشنری",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: Icon(Icons.translate, color: Colors.blue.shade800,),
              ),
              ListTile(
                onTap: (){},
                contentPadding: const EdgeInsets.only(left: 50, right: 50),
                title: const Align(
                  alignment: Alignment.centerRight,
                  child: Text("تنظیمات",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: Icon(Icons.settings_outlined, color: Colors.blue.shade800,),
              ),
              ListTile(
                tileColor: Colors.blue,
                onTap: (){},
                contentPadding: const EdgeInsets.only(left: 50, right: 50),
                title: const Align(
                  alignment: Alignment.centerRight,
                  child: Text("درباره",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),),
                ),
                trailing: Icon(Icons.info_outline, color: Colors.blue.shade800,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
