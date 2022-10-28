import 'package:get/get.dart';

import '../tv_screen/tv_controller.dart';
import 'play_media_controller.dart';

class PlayMediaBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PlayMediaController>(() => PlayMediaController());
    Get.lazyPut<TVController>(() => TVController());
  }
}