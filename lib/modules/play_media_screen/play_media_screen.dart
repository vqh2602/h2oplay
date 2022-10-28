import 'package:chewie/chewie.dart';
import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_controller.dart';
// import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class PlayMediaScreen extends StatefulWidget {
  static const String routeName = '/PlayMediaScreen';
  const PlayMediaScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPlayMediaScreen();
  }
}

class _MyPlayMediaScreen extends State<PlayMediaScreen> {
  //PlayMediaController playMediaController = Get.find();
  PlayMediaController playMediaController = Get.put(PlayMediaController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playMediaController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.pixelstalk.net/wp-content/uploads/2016/06/Free-HD-Starry-Night-Wallpapers-Download-768x432.jpg',),
              fit: BoxFit.fill
            )
          ),
          //color: const Color(0XFF050133),
          child: Stack(
            children: [
              playMediaController.obx((state) =>
                  SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: DpadContainer(
                          onClick: (){
                            playMediaController.chewieController!.isPlaying?
                            playMediaController.chewieController!.pause()
                                :playMediaController.chewieController!.play();
                          },
                          // child:YoYoPlayer(
                          //   aspectRatio: 16 / 9,
                          //   url: "video_url",
                          //   videoStyle: VideoStyle(),
                          //   videoLoadingStyle: VideoLoadingStyle(),
                          // ),
                          child: Chewie(
                            controller: playMediaController.chewieController!,
                          ),
                          onFocus: (focus){})),
              onLoading: const Center(
                child:  CircularProgressIndicator(),
              ))
            ],
          )
        ),
      ),
    );
  }
}
