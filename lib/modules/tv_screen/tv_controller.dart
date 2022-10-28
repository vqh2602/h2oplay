
import 'dart:math';

import 'package:get/get.dart';

import '../../repository/tv_api/tv.dart';
import '../../repository/tv_api/tv_api_connect.dart';

class TVController extends GetxController with StateMixin{
  TV? tv;
  String? url;
  String? group;
  @override
  void onInit() {
    super.onInit();
    getDataTVApi();
  }

  Future<void>getDataTVApi()async {
    change(null, status: RxStatus.loading());
    tv = await TVDataConnectApi().getDataWithID();
    change(null, status: RxStatus.success());
  }
  String getTime(){
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}';
  }
  List<Data> randomList(){
    List<Data> lst = [];
    lst.addAll(tv!.data!);
    return lst;
  }
  List<String> listGroup(){
    List<String> lst = ['VTV',
    'CHUYÊN BIỆT',
    'VTVCab',
    'SCTV',
    'KÊNH PHIM',
    'KÊNH THIẾU NHI',
    'QUỐC TẾ',
    'VTC',
    'HTV',
    'ASIANTV',
    'HÀN QUỐC',
    'NHẬT BẢN',
    'NGA',
    'THỂ THAO',
    'ĐỊA PHƯƠNG',
    'TRUNG QUỐC',
    'ÂM NHẠC',
    'RADIO'];

    return lst;
  }

}