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

class RskAsmtPwrtOvhdSrvyController extends GetxController with GetTickerProviderStateMixin {
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

  // 위험성평가 표준안(송전/가공)-측량 tab
  List<Tab> tabs = [
    const Tab(text: '① 작업공정 안전보건정보'),
    const Tab(text: '② 위험성평가 추정·결정'),
    const Tab(text: '③ 위험성 감소대책 수립 및 개선활동'),
  ];

  final tab1Title = '【① 작업공정 안전보건정보】'.obs;
  final tab2Title = '【② 위험성평가 추정·결정】'.obs;
  final tab3Title = '【③ 위험성 감소대책 수립 및 개선활동】'.obs;

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
      // tab controller 초기화
      tabController = TabController(vsync: this, length: tabs.length, animationDuration: const Duration(milliseconds: 700), initialIndex: 0);

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
          textController[item.documentColumnValue.toString()] = TextEditingController();
          focusNode[item.documentColumnValue.toString()] = FocusNode();
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

    } catch (e) {
      isLoading.value = false;
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '작업전후 안전회의 및 위험성평가 후 교육일지 조회 중 에러가 발생하였습니다.'));
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
          textController[item.documentColumnValue]!.text = item.documentColumnDefaultValue.toString();
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

  /// 중량물 취급 작업계획서 - insert
  Future saveDocData() async {
    try {
      var data = <String, dynamic>{};

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

      var result = await documentDataRepository.insertDocData(data);

      return result;
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '중량물 취급 작업계획서 저장(insert) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 중량물 취급 작업계획서 - update
  Future updateDocData() async {
    try {
      var data = <String, dynamic>{};

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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '중량물 취급 작업계획서 저장(update) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}