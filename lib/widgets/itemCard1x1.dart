
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dpad_container/dpad_container.dart';

class ItemCard1x1 extends StatefulWidget {
  const ItemCard1x1({super.key,String? image, String? name, String? url});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyItemCard1x1();
  }
}

class _MyItemCard1x1 extends State<ItemCard1x1> {
  bool hasChange = false;
  bool isClicked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DpadContainer(
      onClick: null,
      onFocus: (bool isFocused) {  },
      child: null,
    );
  }
}
