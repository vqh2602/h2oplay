
import 'package:get/get.dart';

class HomeController extends GetxController{

  String getTime(){
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}';
  }
}