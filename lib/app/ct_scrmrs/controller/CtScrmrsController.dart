import 'package:async_foreach/async_foreach.dart';
import 'package:dio/dio.dart' as dio;

import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../model/document_column_model.dart';
import '../../../model/document_data_model.dart';
import '../../../repositories/document_column_repository.dart';
import '../../../repositories/document_data_repository.dart';
import '../../../services/auth_service.dart';

import 'package:intl/intl.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CtScrmrsController extends GetxController with GetTickerProviderStateMixin {
  DocumentDataRepository documentDataRepository = DocumentDataRepository();
  DocumentColumnRepository documentColumnRepository = DocumentColumnRepository();
  ScrollController scrollController = ScrollController();
  TabController? tabController;

  final auth = Get.find<AuthService>();
  final textController = <String, TextEditingController>{}.obs;
  final focusNode = <String, FocusNode>{}.obs;

  final isLoading = true.obs;
  final readOnlyYn = false.obs;

  final crud = 'crud-r'.obs;
  final docType = ''.obs;

  final docSn = 0.obs;
  final chckYmd = DateTime.now().obs;             // 점검일자
  // final crtrChckYmd = DateTime.now().obs;         // 기준치 - 측정일자
  final msrmChckYmd = DateTime.now().obs;         // 측정치 - 측정일자

  final imageUrl = <String, dynamic>{}.obs;

  // 모델 선언
  final docDataList = <DocumentData>[].obs;
  final docColList = <DocumentColumn>[].obs;

  @override
  void onInit() async {
    await initState();
    await onRefresh();
    if(Loader.isShown) {Loader.hide();}
    super.onInit();
  }

  initState() async {
    try {
      docColList.clear();
      crud.value = Get.arguments['crud'];
      docType.value = Get.arguments['doc_type'];

      /** 문서 컬럼 불러오기 */
      List<DocumentColumn> result = await documentColumnRepository.getDocColList(docType.value);

      docColList.assignAll(result);
      docColList.refresh();

      /** TextEditingController 선언 */
      await docColList.asyncForEach((item) async {
        // 사진 파일 제외
        if (!item.documentColumnValue!.contains('file')) {
          textController[item.documentColumnValue.toString()] = await TextEditingController();
          focusNode[item.documentColumnValue.toString()] = await FocusNode();
        }
      });

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

  onRefresh() async {
    try {
      Util.print("새로고침");

      isLoading.value = true;

      /** 데이터 초기화 */
      docDataList.clear();

      if (crud.value != 'crud-c') {
        Util.print('성공성공');
        readOnlyYn.value = true;
        docSn.value = Get.arguments['doc_sn'];
        await getDocData();
      } else {
        await defaultValue();
        Util.print('없음없음');
      }

      /** 0.7초 지연 후 로더 지우기 */
      if (isLoading.value) {
        await Future.delayed(const Duration(milliseconds: 700), () {
          isLoading.value = false;
        });
      }

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

  /// 문서 데이터 불러오기
  Future getDocData() async {
    try {
      List<DocumentData> result = await documentDataRepository.getDocData(docSn.value.toString());

      docDataList.assignAll(result);
      docDataList.refresh();

      if (docDataList.isNotEmpty) {
        readOnlyYn.value = true;
      }

      /** 각 데이터 형식의 따른 구분 */
      await docDataList.asyncForEach((item) async {
        if (item.documentColumnValue!.contains('file')) {
          // 이미지 저장
          imageUrl[item.documentColumnValue.toString()] = await value(item.documentDataValue);
        } else {
          // text 저장
          textController[item.documentColumnValue.toString()] = await TextEditingController(text: value(item.documentDataValue));

          // 점검일자
          if (item.documentColumnValue == "chck_ymd") {
            chckYmd.value = await DateTime.parse(textController['chck_ymd']!.text);
          }

          // 측정치 - 측정일자
          if (item.documentColumnValue == "msrm_chck_ymd") {
            msrmChckYmd.value = DateTime.parse(textController['msrm_chck_ymd']!.text);
          }
        }
      });
    } catch (e) {
      isLoading.value = false;
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'CT 2차회로 저항측정 기록표 조회 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 컬럼명의 따른 value 값 가져오기.
  String value(data) {
    var result = '';
    for (var i = 0; i < docDataList.length; i++) {
      if (docDataList[i].documentDataValue == data) {
        result = docDataList[i].documentDataValue.toString();
      }
    }
    return result;
  }

  /// 비고 default 값 작성
  Future defaultValue() async {
    try {
      await docColList.asyncForEach((item) async {
        if (item.documentColumnDefaultValue != '' && item.documentColumnDefaultValue != null) {
          textController[item.documentColumnValue]?.text = await item.documentColumnDefaultValue.toString();
        }
      });
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '초기값 저장 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// CT 2차회로 저항측정 기록표 - insert
  Future saveDocData() async {
    try {
      var data = <String, dynamic>{};

      /** text data */
      for (var item in textController.keys) {
        data[item] = await textController[item]?.text;
      }

      /** image data */
      for (var item in imageUrl.keys) {
        data[item] = await (imageUrl[item].runtimeType.toString() == "_File" ? dio.MultipartFile.fromFileSync(imageUrl[item].path) : imageUrl[item]);
      }

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);                // 점검일자
      // data['crtr_chck_ymd'] = DateFormat('yyyy-MM-dd').format(crtrChckYmd.value);    // 기준치 - 측정일자
      data['msrm_chck_ymd'] = DateFormat('yyyy-MM-dd').format(msrmChckYmd.value);       // 측정치 - 측정일자
      data['doc_sn'] = docSn.value;
      data['doc_type'] = docType.value;

      Util.print(data.toString());

      var result = await documentDataRepository.insertDocData(data);

      return result;
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'CT 2차회로 저항측정 기록표 저장(insert) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// CT 2차회로 저항측정 기록표 - update
  Future updateDocData() async {
    try {
      var data = <String, dynamic>{};

      /** text data */
      for (var item in textController.keys) {
        data[item] = await textController[item]?.text;
      }

      /** image data */
      for (var item in imageUrl.keys) {
        data[item] = await (imageUrl[item].runtimeType.toString() == "_File" ? dio.MultipartFile.fromFileSync(imageUrl[item].path) : imageUrl[item]);
      }

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);                // 점검일자
      // data['crtr_chck_ymd'] = DateFormat('yyyy-MM-dd').format(crtrChckYmd.value);    // 기준치 - 측정일자
      data['msrm_chck_ymd'] = DateFormat('yyyy-MM-dd').format(msrmChckYmd.value);       // 측정치 - 측정일자
      data['doc_sn'] = docSn.value;
      data['doc_type'] = docType.value;

      Util.print(data.toString());

      var result = await documentDataRepository.updateDocData(data);

      return result;
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'CT 2차회로 저항측정 기록표 저장(update) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}