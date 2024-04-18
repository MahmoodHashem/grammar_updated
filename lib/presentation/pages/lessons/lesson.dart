
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class LessonScreen extends StatelessWidget {
   LessonScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'درس اول',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_forward, color: Colors.blue.shade800,)),
      ),
      body: Column(
        children: [
          StepProgressIndicator(
            totalSteps: 5,
            currentStep: 2,
            padding: 0,
            selectedColor: Colors.orange,
            unselectedColor: Color.fromRGBO(224,224, 224, 1.0),
            size: 9,
            roundedEdges: Radius.circular(18),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SelectableText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                             text: 'حروف تعریف\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                              )
                            ),
                            TextSpan(
                             text: ''' حروف تعریف حروفی هستند که یک اسم را به شکل خاص و عام تعریف می کنند به این معنی برای بیان کردن معین و یا نامعین بودن اسم قبل از آن استفاده می شود.
 حروف تعریف به شکل کل به دو نوع تقسیم می شوند:\n 1.	حروف تعریف نامعین ( a/an )\n 2.	حرف تعریف معین ( the )''',
                              style: TextStyle(
                                fontSize: 16
                              )
                            ),
                            TextSpan(
                             text: ''' حروف تعریف حروفی هستند که یک اسم را به شکل خاص و عام تعریف می کنند به این معنی برای بیان کردن معین و یا نامعین بودن اسم قبل از آن استفاده می شود.
 حروف تعریف به شکل کل به دو نوع تقسیم می شوند:\n 1.	حروف تعریف نامعین ( a/an )\n 2.	حرف تعریف معین ( the )''',
                              style: TextStyle(
                                fontSize: 16
                              )
                            ),
                            TextSpan(
                             text: ''' حروف تعریف حروفی هستند که یک اسم را به شکل خاص و عام تعریف می کنند به این معنی برای بیان کردن معین و یا نامعین بودن اسم قبل از آن استفاده می شود.
 حروف تعریف به شکل کل به دو نوع تقسیم می شوند:\n 1.	حروف تعریف نامعین ( a/an )\n 2.	حرف تعریف معین ( the )'''
                            ),
                          ]
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      )
                    ),
                  ), ),
              ],),
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             ElevatedButton(
               style: ButtonStyle(
                   overlayColor: MaterialStatePropertyAll(Colors.transparent),
                minimumSize: MaterialStatePropertyAll(Size(130, 43)),
                 maximumSize: MaterialStatePropertyAll(Size(130, 43)),
                 shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                 ), ),
                   backgroundColor: MaterialStatePropertyAll(Color(0xFF0D47A1))
         ),
                 onPressed: (){
             }, child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Icon(Icons.arrow_back),
                 Text("قبل",style: TextStyle(
                   fontSize: 20
                 ), ),
                 SizedBox(
                   width: 3,
                 ),
               ],
             )),
             ElevatedButton(
               style: ButtonStyle(
                 overlayColor: MaterialStatePropertyAll(Colors.transparent),
                minimumSize: MaterialStatePropertyAll(Size(130, 43)),
                 maximumSize: MaterialStatePropertyAll(Size(130, 43)),
                 shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                 ), ),
                 backgroundColor: MaterialStatePropertyAll(Color(0xFF0D47A1))
         ),
                 onPressed: (){
             }, child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(
                 width: 3,
               ),
                 Text("بعد",style: TextStyle(
                   fontSize: 20
                 ), ),
                 Icon(Icons.arrow_forward),
               ],
             )),
           ],
         ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
