import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../../../model/document_type_model.dart';
import '../../../repositories/document_type_repository.dart';
import '../../../common/ui.dart';
import '../../../services/auth_service.dart';
import '../../../common/util.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController docTypeTextController = TextEditingController();
  DocumentTypeRepository documentTypeRepository = DocumentTypeRepository();
  final auth = Get.find<AuthService>();

  var isLoading = true.obs;

  var selectDocType = ''.obs;                                                   // 선택한 문서종류

  @override
  void onInit() async {
    await onRefresh();
    if(Loader.isShown) {Loader.hide();}
    super.onInit();
  }

  onRefresh() async{
    await getDocType();
    isLoading.value = false;
  }

  // 문서종류 불러오기
  Future getDocType() async {
    try {
      List<DocumentType> result = await documentTypeRepository.getDocType(auth.user.value.entrpsSn!.toInt());
      auth.docTypeList.assignAll(result);
    } catch (e) {
      isLoading.value = false;
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '문서종류 조회 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}