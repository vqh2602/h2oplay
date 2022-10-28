

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/key_api/key_api_connect.dart';

class KeyController extends GetxController with StateMixin{
  TextEditingController keyTE = TextEditingController(text: '');
  String idPhone = '';

  @override
  void onInit() {
    super.onInit();
    getDeviceIdentifier();
    setKeyData();
  }

  Future<void> getDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    idPhone = androidInfo.device;
    //print('Running on:${androidInfo.device}');
    change(null, status: RxStatus.success());// e.g. "Moto G (4)"
    // e.g. "iPod7,1"
  }
  Future<void> checkKey(String key) async {
    await KeyDataConnectApi().getDataWithID(key);
  }
  Future<void> setKeyData() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
// Save an integer value to 'counter' key.
    String? key = prefs.getString('key');
    keyTE.text = key ?? '';
  }
}