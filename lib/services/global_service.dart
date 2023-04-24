import '../common/ui.dart';
import '../model/global_model.dart';
import '../common/util.dart';

import 'dart:io';

import 'package:get/get.dart';

class GlobalService extends GetxService {
  final global = Global().obs;

  Future<GlobalService> init() async {
    var response = await Util.getJsonFile('config/global.json');
    // var response = await Util.getJsonFile('config/global_dev.json');
    // var response = await Util.getJsonFile('config/global_local.json');
    global.value = Global.fromJson(response);

    // linux, macos, web, windows 사용 시 Platform._operatingSystem 에러
    try {
      if (global.value.baseUrl!.indexOf('127.0.0.1') > 0) {
        if (Platform.isAndroid) {
          global.value.baseUrl = "http://10.0.2.2:8000/";
        }
      }

      if (global.value.baseUrl!.indexOf('10.0.2.2') > 0) {
        if (Platform.isIOS) {
          global.value.baseUrl = "http://127.0.0.1:8000/";
        }
      }
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'global service 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }

    global.value.apiFilePath = global.value.baseUrl! + global.value.apiFilePath.toString();
    return this;
  }
}