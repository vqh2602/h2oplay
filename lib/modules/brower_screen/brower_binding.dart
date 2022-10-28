import 'package:get/get.dart';

import 'brower_controller.dart';

class BrowserBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BrowserController>(() => BrowserController());
  }
}