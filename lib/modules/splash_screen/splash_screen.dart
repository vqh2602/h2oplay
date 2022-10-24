import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/home_screen/home_screen.dart';
import 'package:h2oplay/styles/textStyle.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/SplashScreen';
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySplashScreen();
  }
}

class _MySplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(HomeScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0XFF050133),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'H2O Play',
                      style: textTitleBold(Colors.white),
                    ),
                    Text(
                      'Ứng dụng giải trí, xem truyền hình',
                      style: textBody(Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: const LinearProgressIndicator(),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
