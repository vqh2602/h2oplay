// api: lấy danh sách sản phẩm qua mã vạch quét đc

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h2oplay/repository/tv_api/tv.dart';


class TVDataConnectApi extends GetConnect {
  // tìm hàng hoá theo code
  // String apiUrl (String code) => '${Env.config.BASE_SERVICE_API}/v1/category/goods/get-by-code/$code';
  String apiUrl() =>
      'https://h20play-default-rtdb.asia-southeast1.firebasedatabase.app/tv/tv.json';
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

  Future<TV> getDataWithID() async {
    // final Map<String, dynamic> data;
    onInit();
    TV tv;
    final response =
    await get(apiUrl(), headers: getHeaders());
    if (response.status.hasError) {
      showError('');
      return Future.error('loi lau api: ${response.body}');
    } else {
      // data = response.body;
        print('data api: ${response.body}');
      tv = TV.fromJson(response.body);
    }
    return tv;
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
}
