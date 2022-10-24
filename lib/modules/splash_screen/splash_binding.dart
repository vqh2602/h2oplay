import 'package:get/get.dart';
import 'package:h2oplay/modules/splash_screen/splash_controller.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() => SplashController());
  }
}