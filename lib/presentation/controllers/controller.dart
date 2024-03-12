
import 'package:get/get.dart';

class HomeController extends GetxController{

  var activePage = 0.obs;


  void changeActivePage(int index){
    activePage.value = index;
  }


}