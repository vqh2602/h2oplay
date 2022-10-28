import 'package:get/get.dart';

import 'key_controller.dart';

class KeyBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<KeyController>(() => KeyController());
  }
}