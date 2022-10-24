import 'package:flutter/material.dart';
import 'package:h2oplay/styles/textStyle.dart';

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
                      padding: const EdgeInsets.only(right: 20,top: 20),
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
