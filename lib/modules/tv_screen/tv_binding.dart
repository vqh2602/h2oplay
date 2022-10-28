import 'package:get/get.dart';

import 'tv_controller.dart';

class TVBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TVController>(() => TVController());
  }
}