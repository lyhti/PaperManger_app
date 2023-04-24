import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../common/ui.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class SignaturePadController extends GetxController {
  final SignatureController controller = SignatureController(
      penStrokeWidth: 5,
      exportBackgroundColor: Colors.transparent
  );
  Uint8List? signature;

  final isLoading = true.obs;

  var docType = "".obs;
  var title = "".obs;

  @override
  void onInit() async {
    initState();
    // await onRefresh();
    if(Loader.isShown) {Loader.hide();}
    super.onInit();
  }

  void initState() async {
    try {
      docType.value = Get.arguments['doc_type'];
      title.value = Get.arguments['title'];
    } catch (e) {
      isLoading.value = false;
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'initState 확인 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  void onRefresh() async {
    try {

    } catch (e) {
      isLoading.value = false;
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'onRefresh 확인 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}