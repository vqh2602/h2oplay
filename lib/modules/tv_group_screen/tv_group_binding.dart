import 'package:get/get.dart';
import 'package:h2oplay/modules/tv_group_screen/tv_group_controller.dart';

import '../tv_screen/tv_controller.dart';



class TVGroupBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TVGroupController>(() => TVGroupController());
    Get.lazyPut<TVController>(() => TVController());
  }
}