import 'package:dio/dio.dart' as dio;

import '../../../../common/ui.dart';
import '../../../../common/util.dart';
import '../../../../model/document_column_model.dart';
import '../../../../model/document_data_model.dart';
import '../../../../repositories/document_column_repository.dart';
import '../../../../repositories/document_data_repository.dart';
import '../../../../services/auth_service.dart';

import 'package:async_foreach/async_foreach.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/log.dart';

class WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionController extends GetxController with GetTickerProviderStateMixin {
  DocumentDataRepository documentDataRepository = DocumentDataRepository();
  DocumentColumnRepository documentColumnRepository = DocumentColumnRepository();
  ScrollController scrollController = ScrollController();
  TabController? tabController;

  final auth = Get.find<AuthService>();
  final textController = <String, TextEditingController>{}.obs;
  final focusNode = <String, FocusNode>{}.obs;
  final textFieldShow = false.obs;

  final isLoading = true.obs;
  final readOnlyYn = false.obs;

  final coreCheckPoint_2 = 'N'.obs;
  final coreCheckPoint_3_1 = 'N'.obs;
  final coreCheckPoint_3_2 = 'N'.obs;
  final coreCheckPoint_3_3 = 'N'.obs;
  final coreCheckPoint_4_1 = 'N'.obs;
  final coreCheckPoint_4_2 = 'N'.obs;
  final coreCheckPoint_4_3 = 'N'.obs;
  final coreCheckPoint_5_1 = 'N'.obs;
  final coreCheckPoint_5_2 = 'N'.obs;
  final coreCheckPoint_5_3 = 'N'.obs;
  final coreCheckPoint_5_4 = 'N'.obs;
  final coreCheckPoint_5_5 = 'N'.obs;
  final coreCheckPoint_5_6 = 'N'.obs;
  final coreCheckPointPerf_1 = 'N'.obs;
  final coreCheckPointPerf_2 = 'N'.obs;  

  final crud = 'crud-r'.obs;
  final docType = ''.obs;

  final docSn = 0.obs;
  final chckYmd = DateTime.now().obs;

  final imageUrl = <String, dynamic>{}.obs;

  // 모델 선언
  final docDataList = <DocumentData>[].obs;
  final docColList = <DocumentColumn>[].obs;

  final paddingValue = 10;
  final measureDateAreaHeight = 40;
  final equipmentNameAreaHeight = 40;
  final buttonAreaHeight = 40;
  final photoAspectRatio = 2.0;
  final safeAreaHeight = 20;

  // 모바일 제스쳐 zoom in/out
  final size = 100.0.obs;

  RxBool isInitialized = false.obs;

  @override
  void onInit() async {
    await initState();
    await onRefresh();
    if(Loader.isShown) {Loader.hide();}
    super.onInit();
    isInitialized.value = true;
  }

  initState() async {
    try {
      docColList.clear();
      crud.value = Get.arguments['crud'];
      docType.value = Get.arguments['doc_type'];

      /** 문서 컬럼 불러오기 */
      List<DocumentColumn> result = await documentColumnRepository.getDocColList(docType.value);

      logger.d(result);

      docColList.assignAll(result);
      docColList.refresh();

      /** TextEditingController 선언 */
      await docColList.asyncForEach((item) async {
        // 사진 파일 제외
        if (!item.documentColumnValue!.contains('file')) {
          textController[item.documentColumnValue.toString()] = TextEditingController();
          focusNode[item.documentColumnValue.toString()] = FocusNode();
        }
      });

      logger.d(coreCheckPoint_2.value);
      logger.d(coreCheckPoint_3_1.value);
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
        Util.print('없음없음');
        await defaultValue();
      }

      /** 0.7초 지연 후 로더 지우기 */
      if (isLoading.isTrue) {
        await Future.delayed(const Duration(milliseconds: 700), () {
          isLoading.value = false;
          update();     // GetBuilder 사용으로 인한 update 처리
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
      await docDataList.asyncForEach((element) async {
        if (element.documentColumnValue!.contains('file')) {
          // 이미지 저장
          imageUrl[element.documentColumnValue.toString()] = value(element.documentDataValue);
        } else {
          // text 저장
          textController[element.documentColumnValue.toString()] = TextEditingController(text: value(element.documentDataValue));

          // 점검일자
          if (element.documentColumnValue == 'chck_ymd') {
            chckYmd.value = DateTime.parse(value(element.documentDataValue));
          }
        }
      });

      coreCheckPoint_2.value = textController['core_check_point_2']!.text;
      coreCheckPoint_3_1.value = textController['core_check_point_3_1']!.text;
      coreCheckPoint_3_2.value = textController['core_check_point_3_2']!.text;
      coreCheckPoint_3_3.value = textController['core_check_point_3_3']!.text;
      coreCheckPoint_4_1.value = textController['core_check_point_4_1']!.text;
      coreCheckPoint_4_2.value = textController['core_check_point_4_2']!.text;
      coreCheckPoint_4_3.value = textController['core_check_point_4_3']!.text;
      coreCheckPoint_5_1.value = textController['core_check_point_5_1']!.text;
      coreCheckPoint_5_2.value = textController['core_check_point_5_2']!.text;
      coreCheckPoint_5_3.value = textController['core_check_point_5_3']!.text;
      coreCheckPoint_5_4.value = textController['core_check_point_5_4']!.text;
      coreCheckPoint_5_5.value = textController['core_check_point_5_5']!.text;
      coreCheckPoint_5_6.value = textController['core_check_point_5_6']!.text;
      coreCheckPointPerf_1.value = textController['core_check_point_perf_1']!.text;
      coreCheckPointPerf_2.value = textController['core_check_point_perf_2']!.text;

    } catch (e) {
      isLoading.value = false;
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '25-작업안전 체크리스트(S17 철구 조립 및 모선배선공사) 조회 중 에러가 발생하였습니다.'));
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
    logger.d('defaultValue is called');
    try {
      await docColList.asyncForEach((item) async {
        if (item.documentColumnDefaultValue != '' && item.documentColumnDefaultValue != null) {
          textController[item.documentColumnValue]!.text = item.documentColumnDefaultValue.toString();
        }


        switch (item.documentColumnValue) {
          case 'core_check_point_2':
            logger.d(textController[item.documentColumnValue]!.text);
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_2.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_3_1':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_3_1.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_3_2':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_3_2.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_3_3':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_3_3.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_4_1':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_4_1.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_4_2':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_4_2.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_4_3':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_4_3.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_5_1':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_5_1.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_5_2':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_5_2.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_5_3':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_5_3.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_5_4':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_5_4.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_5_5':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_5_5.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_5_6':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPoint_5_6.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_perf_1':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPointPerf_1.value = item.documentColumnDefaultValue.toString();
            }
            break;

          case 'core_check_point_perf_2':
            if(textController[item.documentColumnValue]!.text != '') {
              coreCheckPointPerf_2.value = item.documentColumnDefaultValue.toString();
            }
            break;
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

  /// 사진첩 이미지 가져오기
  Future getGallery(String path) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        Util.print(image.path);
        imageUrl[path] = image;
        imageUrl.refresh();
        update();     // GetBuilder 사용으로 인한 update 처리
      }

    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '갤러리 조회 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 카메라 이미지 가져오기
  Future getCamera(String path) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        Util.print(image.path);

        /** 사진첩에 이미지 저장 */
        ImageGallerySaver.saveFile(image.path);

        imageUrl[path] = image;
        imageUrl.refresh();
        update();     // GetBuilder 사용으로 인한 update 처리
      }

    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '카메라 조회 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 작업안전 체크리스트(S17 철구 조립 및 모선배선공사) - insert
  Future saveDocData() async {
    try {
      var data = <String, dynamic>{};

      logger.d(coreCheckPoint_3_1.value);

      textController['core_check_point_2']?.text = coreCheckPoint_2.value;
      textController['core_check_point_3_1']?.text = coreCheckPoint_3_1.value;
      textController['core_check_point_3_2']?.text = coreCheckPoint_3_2.value;
      textController['core_check_point_3_3']?.text = coreCheckPoint_3_3.value;
      textController['core_check_point_4_1']?.text = coreCheckPoint_4_1.value;
      textController['core_check_point_4_2']?.text = coreCheckPoint_4_2.value;
      textController['core_check_point_4_3']?.text = coreCheckPoint_4_3.value;
      textController['core_check_point_5_1']?.text = coreCheckPoint_5_1.value;
      textController['core_check_point_5_2']?.text = coreCheckPoint_5_2.value;
      textController['core_check_point_5_3']?.text = coreCheckPoint_5_3.value;
      textController['core_check_point_5_4']?.text = coreCheckPoint_5_4.value;
      textController['core_check_point_5_5']?.text = coreCheckPoint_5_5.value;
      textController['core_check_point_5_6']?.text = coreCheckPoint_5_6.value;
      textController['core_check_point_perf_1']?.text = coreCheckPointPerf_1.value;
      textController['core_check_point_perf_2']?.text = coreCheckPointPerf_2.value;

      logger.d(textController);

      /** text data */
      for (var item in textController.keys) {
        data[item] = textController[item]?.text;
      }

      logger.d(data);

      /** image data */
      for (var item in imageUrl.keys) {
        data[item] = await (imageUrl[item].runtimeType.toString() == "_File" ? dio.MultipartFile.fromFileSync(imageUrl[item].path) : imageUrl[item]);
      }

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);      // 점검일자
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '작업안전 체크리스트(S17 철구 조립 및 모선배선공사) 저장(insert) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 작업안전 체크리스트(S17 철구 조립 및 모선배선공사) - update
  Future updateDocData() async {
    try {
      var data = <String, dynamic>{};

      textController['core_check_point_2']?.text = coreCheckPoint_2.value;
      textController['core_check_point_3_1']?.text = coreCheckPoint_3_1.value;
      textController['core_check_point_3_2']?.text = coreCheckPoint_3_2.value;
      textController['core_check_point_3_3']?.text = coreCheckPoint_3_3.value;
      textController['core_check_point_4_1']?.text = coreCheckPoint_4_1.value;
      textController['core_check_point_4_2']?.text = coreCheckPoint_4_2.value;
      textController['core_check_point_4_3']?.text = coreCheckPoint_4_3.value;
      textController['core_check_point_5_1']?.text = coreCheckPoint_5_1.value;
      textController['core_check_point_5_2']?.text = coreCheckPoint_5_2.value;
      textController['core_check_point_5_3']?.text = coreCheckPoint_5_3.value;
      textController['core_check_point_5_4']?.text = coreCheckPoint_5_4.value;
      textController['core_check_point_5_5']?.text = coreCheckPoint_5_5.value;
      textController['core_check_point_5_6']?.text = coreCheckPoint_5_6.value;
      textController['core_check_point_perf_1']?.text = coreCheckPointPerf_1.value;
      textController['core_check_point_perf_2']?.text = coreCheckPointPerf_2.value;

      /** text data */
      for (var item in textController.keys) {
        data[item] = textController[item]?.text;
      }

      /** image data */
      for (var item in imageUrl.keys) {
        data[item] = await (imageUrl[item].runtimeType.toString() == "_File" ? dio.MultipartFile.fromFileSync(imageUrl[item].path) : imageUrl[item]);
      }

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);      // 점검일자
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '작업안전 체크리스트(S17 철구 조립 및 모선배선공사) 저장(update) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}