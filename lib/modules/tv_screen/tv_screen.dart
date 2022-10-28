import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/home_screen/home_controller.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_controller.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_screen.dart';
import 'package:h2oplay/modules/tv_group_screen/tv_group_binding.dart';
import 'package:h2oplay/modules/tv_group_screen/tv_group_screen.dart';
import 'package:h2oplay/modules/tv_screen/tv_controller.dart';
import 'package:h2oplay/styles/textStyle.dart';

import '../../widgets/itemCard13x2.dart';
import '../../widgets/itemCard1x1.dart';

class TVScreen extends StatefulWidget {
  static const String routeName = '/TVScreen';
  const TVScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTVScreen();
  }
}

class _MyTVScreen extends State<TVScreen> {
  TVController tvController = Get.find();
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
          child: tvController.obx((state) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                  child: Text('Bây giờ xem gì?',style: textBody(Colors.white),),
              ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: allTV()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text('Thể loại',style: textBody(Colors.white),),
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

  Widget allTV(){
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tvController.randomList().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: ItemCard1x1(
              name: tvController.randomList()[index].name!,
              image: tvController.randomList()[index].image!,
              url: tvController.randomList()[index].url!,
              router: PlayMediaScreen.routeName,),
          );
        }
    );
  }

  Widget allGroup(){
   return GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 4 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        itemCount: tvController.listGroup().length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard3x2(
            name: tvController.listGroup()[index],
            group: tvController.listGroup()[index],
            router: TVGroupScreen.routeName,);
        }
    );
  }
}
