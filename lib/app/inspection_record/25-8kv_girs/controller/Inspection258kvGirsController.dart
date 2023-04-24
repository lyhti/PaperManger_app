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

class Inspection258kvGirsController extends GetxController with GetTickerProviderStateMixin {
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

  // 25.8kv GIS(보통, 정밀) 점검기록표 고정 tab
  List<Tab> tabs = [
    const Tab(text: '개요'),
    const Tab(text: '1. 활선상태 점검'),
    const Tab(text: '2. 작업전 안전점검'),
    const Tab(text: '3. 지시치 확인'),
    const Tab(text: '4. 외부 일반 점검'),
    const Tab(text: '5. 조작함, 조작기구, 제어회로 점검'),
    const Tab(text: '6. SF₆ Gas 분석'),
    const Tab(text: '7. 각종시험'),
    const Tab(text: '8. Gas 밀도 검출기 시험'),
    const Tab(text: '9. Gas 누기 점검분석'),
    const Tab(text: '10. 절연저항 측정'),
    const Tab(text: '11. 차단기 동작특성 시험'),
    const Tab(text: '12. 변류기시험'),
    const Tab(text: '13. Close / Trip Coil 저항 측정'),
    const Tab(text: '14. VI접점 마모량 측정'),
    const Tab(text: '15. 조작Rod 행정거리 측정 (제작사별 취급설명서 참조)'),
    const Tab(text: '16. 부하전류 측정, LPS Lamp 점검'),
    const Tab(text: '17. 최종확인'),
    const Tab(text: '18. 담당자 의견'),
  ];

  // 점검기록표 점검결과 고정 selectBox
  final checkResultList = ['양호', '조치 후 양호', '불량', '해당없음'].obs;
  final checkWeather = ['맑음', '흐림', '비', '직접입력'].obs;
  final weatherValue = ''.obs;

  final crud = 'crud-r'.obs;
  final docType = ''.obs;

  final docSn = 0.obs;
  final chckYmd = DateTime.now().obs;
  // final prdcYm = DateTime.tryParse(DateFormat('yyyy-MM').format(DateTime.now())).obs;
  final prdcYm = DateTime.now().obs;

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

  @override
  void onInit() async {
    await initState();
    await onRefresh();
    if(Loader.isShown) {Loader.hide();}
    super.onInit();
  }

  initState() async {
    try {
      /** TabController 초기 선언 */
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
          imageUrl[element.documentColumnValue.toString()] = await value(element.documentDataValue);
        } else {
          // text 저장
          textController[element.documentColumnValue.toString()] = await TextEditingController(text: value(element.documentDataValue));

          // 점검일자
          if (element.documentColumnValue == 'chck_ymd') {
            chckYmd.value = await DateTime.parse(value(element.documentDataValue));
          }
          // 제작년월
          if (element.documentColumnValue == 'prdc_ym') {
            // 년-월 만 있으면 DateTime 인식 불가능하여 임시로 일 : 01 추가
            prdcYm.value = (await DateTime.tryParse("${value(element.documentDataValue)}-01"))!;
          }
          // 날씨
          if (element.documentColumnValue == 'weather') {
            if (checkWeather.contains(value(element.documentDataValue))) {
              weatherValue.value = await value(element.documentDataValue);
            } else {
              weatherValue.value = '직접입력';
              textFieldShow.value = true;
            }
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '25-8kV GIS(보통_정밀) 점검기록표 조회 중 에러가 발생하였습니다.'));
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

  /// 25-8kV GIS(보통_정밀) 점검기록표 - insert
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

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);      // 점검일자
      data['prdc_ym'] = DateFormat('yyyy-MM').format(prdcYm.value);      // 제작년월
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '25-8kV GIS(보통_정밀) 점검기록표 저장(insert) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 25-8kV GIS(보통_정밀) 점검기록표 - update
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

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);      // 점검일자
      data['prdc_ym'] = DateFormat('yyyy-MM').format(prdcYm.value);      // 제작년월
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '25-8kV GIS(보통_정밀) 점검기록표 저장(update) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}