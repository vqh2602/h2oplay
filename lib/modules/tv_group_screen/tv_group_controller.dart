
import 'package:get/get.dart';
import 'package:h2oplay/modules/tv_screen/tv_controller.dart';
import 'package:h2oplay/repository/tv_api/tv.dart';

class TVGroupController extends GetxController with StateMixin{
  TVController tvController = Get.find();
  String? url;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  List<Data> listGroup(){
    List<Data> lst = [];
    for(var x in tvController.tv!.data!){
      if(x.group!.toLowerCase().contains(tvController.group!.toLowerCase())){
        lst.add(x);
      }
    }
    return lst;
  }

}