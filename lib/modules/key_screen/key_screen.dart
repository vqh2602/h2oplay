import 'dart:async';

import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/home_screen/home_screen.dart';
import 'package:h2oplay/modules/key_screen/key_controller.dart';
import 'package:h2oplay/styles/textStyle.dart';

import '../../widgets/custom_number_keybroad.dart';

class KeyScreen extends StatefulWidget {
  static const String routeName = '/KeyScreen';
  const KeyScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyKeyScreen();
  }
}

class _MyKeyScreen extends State<KeyScreen> {
  bool doneFocus = false;
  KeyController keyController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
          // color: const Color(0XFF050133),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text(
                      'Khoá sản phẩm',
                      style: textTitleBold(Colors.white),
                    ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(child: TextField(
                        controller: keyController.keyTE,
                        showCursor: true,
                        readOnly: true,
                        enabled: false,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Key',
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                      )),
                      DpadContainer(
                          onClick: (){
                            keyController.checkKey(keyController.keyTE.text ?? '_');
                            // Get.toNamed(HomeScreen.routeName);
                          },
                          child: Icon(CupertinoIcons.arrow_right_circle,
                            size: 50,
                            color: doneFocus
                              ?Colors.lightBlue
                              :Colors.white,),
                          onFocus: (focus){
                            setState(() {
                              doneFocus = focus;
                            });
                          })
                    ],
                  ),
                ),
                Expanded(child: CustomNumberKeyboard(textEditingController: keyController.keyTE,)),
                keyController.obx((state) =>
                    Text(keyController.idPhone,style: const TextStyle(color: Colors.grey),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
