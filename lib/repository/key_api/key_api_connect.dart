// api: lấy danh sách sản phẩm qua mã vạch quét đc

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/modules/home_screen/home_screen.dart';
import 'package:h2oplay/modules/key_screen/key_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
{
     "001VQH2602":   {
            "keyd":"001VQH2602",
            "time":30,
            "exp": null,
            "divice": null
        },
        "002VQH2602": {
            "keyd":"002VQH2602",
            "time":30,
            "exp": null,
            "divice": null
        },
        "003VQH2602": {
            "keyd":"003VQH2602",
            "time":30,
            "exp": null,
            "divice": null
        }
}
 */

class KeyDataConnectApi extends GetConnect {
  KeyController keyController = Get.put(KeyController());
  // tìm hàng hoá theo code
  // String apiUrl (String code) => '${Env.confICE_API}/v1/category/goods/get-by-code/$code';
  String apiUrl(String key) =>
      'https://h20play-default-rtdb.asia-southeast1.firebasedatabase.app/key/key.json?orderBy="keyd"&equalTo="$key"';
  // String apiUrl(String code, String stkId, String locaSymb) =>
  //     'http://dev.s-erp.com.vn:9065/v1/category/goods/get-by-code/2006069877';
  @override
  void onInit() {
    allowAutoSignedCert = true;
  }

  Map<String, String>? getHeaders() {
    Map<String, String> header = {
      "Content-Type": "application/json, charset=UTF-8",
    };
    return header;
  }

  Future<void> getDataWithID(String key) async {
     Map<String, dynamic> data ={};
    onInit();
    final response = await get(apiUrl(key), headers: getHeaders());
    data = response.body;
    print("data: ${response.body} |  ${apiUrl(key)}");
    if (response.status.hasError || data[key] == null) {
      showError('Hoặc không tìm thấy khóa sản phẩm');
      return Future.error('loi lau api: ${response.body}');
    } else {
      if(data[key]["divice"]== null || data[key]["divice"]==''){
        patchDataWithID(key);
      }else if(data[key]["divice"] == keyController.idPhone){
        if(DateTime.parse(data[key]["exp"]).add(Duration(days:data[key]["time"])).isAfter(DateTime.now())){
          // Obtain shared preferences.
          final prefs = await SharedPreferences.getInstance();
          // Save an integer value to 'counter' key.
          await prefs.setString('key', key);
          showDone('chào mừng quay lại');
          Get.offAllNamed(HomeScreen.routeName);
        }else{
          showError('Key đã hết hạn, hãy gia hạn key');
        }
      }else{
        //print('2 thiet bi');
        showError('Key đã được sử dụng cho thiết bị khác');
      }
    }
  }

  Future<void> patchDataWithID(String key) async {
    Map<String, dynamic> json ={
      key:   {
        "keyd":key,
        "time":30,
        "exp": DateTime.now().toString(),
        "divice": keyController.idPhone
      },
    };
    Map<String, dynamic> data ={};
    onInit();
    final response = await patch(
    'https://h20play-default-rtdb.asia-southeast1.firebasedatabase.app/key/key.json'
    ,json);
    data = response.body;
    //print("data: ${response.body} |  ${apiUrl(key)}");
    if (response.status.hasError) {
      showError('');
      return Future.error('loi lau api: ${response.body}');
    } else {
      if(data[key]["divice"]!= null){
        showDone('Đã kích hoạt cho thiết bị này, click lại nút start để truy cập ứng dụng');
      }
    }
  }

  void showError(String? error){
    Get.snackbar(
      'Có lỗi',
      'Lỗi kết nối đến server'
          '\n${error??''}',
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 30,
      ),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }
  void showDone(String? error){
    Get.snackbar(
      'Thao tác thành công',
          '\n${error??''}',
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
        size: 30,
      ),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }
}
