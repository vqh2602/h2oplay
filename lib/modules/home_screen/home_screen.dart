import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/brower_screen/brower_screen.dart';
import 'package:h2oplay/modules/home_screen/home_controller.dart';
import 'package:h2oplay/modules/tv_screen/tv_screen.dart';
import 'package:h2oplay/styles/textStyle.dart';

import '../../widgets/itemCard1x1.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomeScreen();
  }
}

class _MyHomeScreen extends State<HomeScreen> {
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.pixelstalk.net/wp-content/uploads/2016/06/Free-HD-Starry-Night-Wallpapers-Download-768x432.jpg',),
              fit: BoxFit.fill
            )
          ),
          //color: const Color(0XFF050133),
          child: Column(
            children: [
              Container(
                child: Text(homeController.getTime(),style: textTitleBold(Colors.white),),
              ),
              const SizedBox(height: 20,),
              Expanded(child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (1 / .7),
                children:const [
                  ItemCard1x1(name: 'TV',icon: Icon(CupertinoIcons.tv,size:150,color: Colors.white,),router: TVScreen.routeName,),
                  ItemCard1x1(name: 'Movies',icon: Icon(CupertinoIcons.film,size:150,color: Colors.white,),),
                  ItemCard1x1(name: 'Browser',icon: Icon(Icons.web,size:150,color: Colors.white,),router: BrowserScreen.routeName,),
                  ItemCard1x1(name: 'Setting',icon: Icon(Icons.settings,size:150,color: Colors.white,),)
                ],
              ),)
            ],
          )
        ),
      ),
    );
  }
}
