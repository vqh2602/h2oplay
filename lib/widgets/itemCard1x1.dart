import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:dpad_container/dpad_container.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_screen.dart';
import 'package:h2oplay/modules/tv_screen/tv_controller.dart';
import 'package:h2oplay/styles/textStyle.dart';

class ItemCard1x1 extends StatefulWidget {
  const ItemCard1x1({super.key, this.image, this.name, this.url, this.router,this.icon});
  final String? image;
  final String? name;
  final String? url;
  final String? router;
  final Widget? icon;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyItemCard1x1();
  }
}

class _MyItemCard1x1 extends State<ItemCard1x1> {
  bool hasChange = false;
  bool isClicked = false;
  TVController tvController = Get.put(TVController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DpadContainer(
      onClick: () {
        setState(() {
          hasChange = true;
        });
        setDataController(widget.router,widget.url);
      },
      onFocus: (focus) {
        setState(() {
          hasChange = !hasChange;
        });
      },
      child: BlurryContainer(
        blur: 5,
        // width: 200,
        // height: 200,
        elevation: 0,
        color: Colors.black12,
        //padding: const EdgeInsets.all(8),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: hasChange ? Colors.white12 : Colors.black12,
              border: Border.all(
                color: hasChange
                    ? Colors.white
                    : isClicked
                    ? Colors.white
                    : Colors.white12,
                width: 5,
              ),
              // image: widget.image!=null
              //     ?DecorationImage(
              //   image: NetworkImage(widget.image!),
              //   fit: BoxFit.cover,
              // )
              //     : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icon!=null?widget.icon!:const SizedBox(),
                widget.image!=null?Expanded(flex:2,child: Image.network(widget.image!,fit: BoxFit.contain,)):const SizedBox(),
                Expanded(flex:1,child: Center(
                  child: Text(
                    widget.name!,
                    textAlign: TextAlign.center,
                    style: textLabel(Colors.white),
                  ),
                ))
              ],
            ),
        ),
      ),
    );
  }

  Future<void> setDataController(String? router,String? url) async {
    print('url: ${router}');
    switch(router){
      case PlayMediaScreen.routeName:
        tvController.url = url ?? 'http://a.com/';
        Get.toNamed(router!);
        break;
      default: Get.toNamed(router!);
    }
  }
}
