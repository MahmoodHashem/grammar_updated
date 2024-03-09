

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grammar_updated/domain/widgets/head.dart';
import 'package:grammar_updated/app/util/consts/level_contents.dart';
import 'package:grammar_updated/presentation/controllers/controller.dart';

import '../../domain/widgets/home_list_tile.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {

  var homeCtrl = Get.put(HomeController());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(13, 71, 161, 1.0),),
        shadowColor: const Color.fromRGBO(0,0, 0, 0.5),
        backgroundColor: Colors.white,
        title: const Text('MGrammar',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'LEMON MILK Pro FTR Medium',
          ),
        ),
        leading: const Icon(Icons.account_circle_rounded,
          color: Color.fromRGBO(13, 71, 161, 1,),
          size: 24,
        ),
        centerTitle: true,
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index,r){
                    homeCtrl.changeActivePage(index);
                    print(homeCtrl.activePage.value);
                },
                height: 200.0,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
              ),
              items: List.generate(titles.length, (i) => Level(
                  colorOfContainer: cardColors[i],
                  colorOfUnselectedProgress: unSelectedProgressColor[i],
                  title: titles[i],
                  subtitle: subtitles[i],
                  colorOfSubtitle: subtitleColors[i])),
            ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (i) =>
              Obx(() => Container(
                  margin: const EdgeInsets.all(2),
                  child:  Icon(Icons.circle,
                      size: 10,
                      color: homeCtrl.activePage.value == i ? colorsOfIndicator[homeCtrl.activePage.value] : Colors.grey,
                  ),
                ),
              )),
        ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (c) => const Notes()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 80,
                child: HomeListTile(
                  needProgress: false,
                  title: 'نوت های من',
                  icon: Icons.edit_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Practice() ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 80,
                child: HomeListTile(
                    title: '      تمرین ها',
                    icon: Icons.edit_note
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 80,
              child: HomeListTile(
                title: 'تست های پایانی',
                icon: Icons.assignment,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
