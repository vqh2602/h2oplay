
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../tv_screen/tv_controller.dart';

class PlayMediaController extends GetxController with StateMixin{
  TVController tvController = Get.find();
  late final VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  Chewie? playerWidget ;

  @override
  Future<void> onInit() async {
    super.onInit();
    eventRemote();
    change(null, status: RxStatus.loading());
    setVideoPlayController();
    await initPlay();
    setPlayController();
    change(null, status: RxStatus.success());
  }


  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();

  }

  Future<void> setVideoPlayController()async {
    try{
      videoPlayerController = VideoPlayerController.network(tvController.url!);
      print('link video strem: ${tvController.url!}');
    }catch(_){
      Get.snackbar('Lỗi', 'Có lỗi khi phát kênh này, thử lại sau');
    }
  }

  Future<void> setPlayController()async {
try{
  chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: false,
    fullScreenByDefault: true,
  );
}catch(_){
  print('lỗi');
  Get.snackbar('Lỗi', 'Có lỗi khi phát kênh này, thử lại sau');
}

  }
  Future<void> initPlay() async {
    await videoPlayerController.initialize();
  }
  Future<void> eventRemote()async {
    RawKeyboard.instance.addListener((event) {
      if (LogicalKeyboardKey.arrowLeft == event.logicalKey) {
        back10s();
        return;
      } else if (LogicalKeyboardKey.arrowRight == event.logicalKey) {
        goTo10s();
        return;
      } else if (LogicalKeyboardKey.arrowUp == event.logicalKey) {
        print('up');
        return;
      } else if (LogicalKeyboardKey.arrowDown == event.logicalKey) {
        print('down');
        return;
      }else if (LogicalKeyboardKey.goBack == event.logicalKey) {
        return;
      }
    });
        }
  Future<void> goTo10s()async {
    Duration currentPosition = videoPlayerController.value.position;
    Duration targetPosition = currentPosition + const Duration(seconds: 10);
    videoPlayerController.seekTo(targetPosition);
  }
  Future<void> back10s()async {
    Duration currentPosition = videoPlayerController.value.position;
    Duration targetPosition = currentPosition - const Duration(seconds: 10);
    videoPlayerController.seekTo(targetPosition);
  }
}