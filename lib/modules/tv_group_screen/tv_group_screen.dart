import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_screen.dart';
import 'package:h2oplay/modules/tv_group_screen/tv_group_controller.dart';
import 'package:h2oplay/styles/textStyle.dart';

import '../../widgets/itemCard13x2.dart';
import '../../widgets/itemCard1x1.dart';

class TVGroupScreen extends StatefulWidget {
  static const String routeName = '/TVGroupScreen';
  const TVGroupScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTVGroupScreen();
  }
}

class _MyTVGroupScreen extends State<TVGroupScreen> {
  TVGroupController tvGroupController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.pixelstalk.net/wp-content/uploads/2016/06/Free-HD-Starry-Night-Wallpapers-Download-768x432.jpg',),
              fit: BoxFit.fill
            )
          ),
          //color: const Color(0XFF050133),
          child: tvGroupController.obx((state) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(tvGroupController.tvController.group ?? '',style: textBody(Colors.white),),
                  ),
                  Expanded(
                      // width: MediaQuery.of(context).size.width,
                      // height: 200,
                      child: allGroup())
            ],
          ))
        ),
      ),
    );
  }

  Widget allGroup(){
   return GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemCount: tvGroupController.listGroup().length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard3x2(
            name: tvGroupController.listGroup()[index].name!,
            image: tvGroupController.listGroup()[index].image!,
            url: tvGroupController.listGroup()[index].url!,
            router: PlayMediaScreen.routeName,);
        }
    );
  }
}
