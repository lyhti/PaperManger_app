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

class WorkSafetyMeetingRiskAssessmentEducationJournalController  extends GetxController with GetTickerProviderStateMixin {
  DocumentDataRepository documentDataRepository = DocumentDataRepository();
  DocumentColumnRepository documentColumnRepository = DocumentColumnRepository();
  ScrollController scrollController = ScrollController();

  final auth = Get.find<AuthService>();
  final textController = <String, TextEditingController>{}.obs;
  final focusNode = <String, FocusNode>{}.obs;
  final textFieldShow = false.obs;

  final possibilityList = ['', '가능', '불가'];
  final existList = ['', '무', '유'];
  final goodList = ['', '양', '불'];

  final isLoading = true.obs;
  final readOnlyYn = false.obs;

  final crud = 'crud-r'.obs;
  final docType = ''.obs;
  final dataVersion = 1.obs;
  final viewVersion = 1.obs;

  final docSn = 0.obs;
  final chckYmd = DateTime.now().obs;
  final chckTime = DateTime.now().toString().substring(11, 16).obs;

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

  RxString workAsngAnormYn1 = ''.obs;
  RxString workAsngAnormYn2 = ''.obs;
  RxString workAsngAnormYn3 = ''.obs;
  RxString workAsngAnormYn4 = ''.obs;
  RxString workAsngAnormYn5 = ''.obs;
  RxString workAsngAnormYn6 = ''.obs;

  RxString phslAlchBfrWorkExistYn = ''.obs;
  RxString phslAlchAftrWorkExistYn = ''.obs;
  RxString phslAnormExistYn = ''.obs;
  RxString mntlWillGoodYn = ''.obs;
  RxString mntlStressExistYn = ''.obs;
  RxString inlgAsngAwareGoodYn = ''.obs;
  RxString inlgSftAwareGoodYn = ''.obs;
  RxString snsbSleepGoodYn = ''.obs;
  RxString snsbRespGoodYn = ''.obs;

  RxString manWorkPsb1 = ''.obs;
  RxString manWorkPsb2 = ''.obs;
  RxString manWorkPsb3 = ''.obs;

  RxString eqpWorkPsb1 = ''.obs;
  RxString eqpWorkPsb2 = ''.obs;
  RxString eqpWorkPsb3 = ''.obs;

  RxString envWorkPsb1 = ''.obs;
  RxString envWorkPsb2 = ''.obs;
  RxString envWorkPsb3 = ''.obs;

  RxString mgtWorkPsb1 = ''.obs;
  RxString mgtWorkPsb2 = ''.obs;
  RxString mgtWorkPsb3 = ''.obs;

  RxBool isInitialized = false.obs;

  // 모바일 제스쳐 zoom in/out
  final size = 100.0.obs;

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
      
      dataVersion.value = Get.arguments['data_version'];
      viewVersion.value = Get.arguments['view_version'];

      /** 문서 컬럼 불러오기 */
      List<DocumentColumn> result = [];

      switch(crud.value) {
        case 'crud-r':
          result = await documentColumnRepository.getDocColListWithVersion(docType.value, dataVersion.value, viewVersion.value);
          break;
        case 'crud-c':
          result = await documentColumnRepository.getCrntDocColList(docType.value);
          break;
        default:
          logger.d("WorkSafetyMeetingRiskAssessmentEducationJournal1Controller initState - invalud crud.value");
      }

      // List<DocumentColumn> result = await documentColumnRepository.getDocColList(docType.value);
      // List<DocumentColumn> result = await documentColumnRepository.getDocColList1(docType.value, dataVersion.value, viewVersion.value);

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

          switch(element.documentColumnValue) {
            case 'work_asng_anorm_yn_1':
              workAsngAnormYn1.value = value(element.documentDataValue);
            break;

            case 'work_asng_anorm_yn_2':
              workAsngAnormYn2.value = value(element.documentDataValue);
            break;

            case 'work_asng_anorm_yn_3':
              workAsngAnormYn3.value = value(element.documentDataValue);
            break;

            case 'work_asng_anorm_yn_4':
              workAsngAnormYn4.value = value(element.documentDataValue);
            break;

            case 'work_asng_anorm_yn_5':
              workAsngAnormYn5.value = value(element.documentDataValue);
            break;

            case 'work_asng_anorm_yn_6':
              workAsngAnormYn6.value = value(element.documentDataValue);
            break;

            case 'phsl_alch_bfr_work_exist_yn':
              phslAlchBfrWorkExistYn.value = value(element.documentDataValue);
            break;

            case 'phsl_alch_aftr_work_exist_yn':
              phslAlchAftrWorkExistYn.value = value(element.documentDataValue);
            break;

            case 'phsl_anorm_exist_yn':
              phslAnormExistYn.value = value(element.documentDataValue);
            break;

            case 'mntl_will_good_yn':
              mntlWillGoodYn.value = value(element.documentDataValue);
            break;

            case 'mntl_stress_exist_yn':
              mntlStressExistYn.value = value(element.documentDataValue);
            break;

            case 'inlg_asng_aware_good_yn':
              inlgAsngAwareGoodYn.value = value(element.documentDataValue);
            break;

            case 'inlg_sft_aware_good_yn':
              inlgSftAwareGoodYn.value = value(element.documentDataValue);
            break;

            case 'snsb_sleep_good_yn':
              snsbSleepGoodYn.value = value(element.documentDataValue);
            break;

            case 'snsb_resp_good_yn':
              snsbRespGoodYn.value = value(element.documentDataValue);
            break;

            case 'man_work_psb_1':
              manWorkPsb1.value = value(element.documentDataValue);
            break;

            case 'man_work_psb_2':
              manWorkPsb2.value = value(element.documentDataValue);
            break;

            case 'man_work_psb_3':
              manWorkPsb3.value = value(element.documentDataValue);
            break;

            case 'eqp_work_psb_1':
              eqpWorkPsb1.value = value(element.documentDataValue);
            break;

            case 'eqp_work_psb_2':
              eqpWorkPsb2.value = value(element.documentDataValue);
            break;

            case 'eqp_work_psb_3':
              eqpWorkPsb3.value = value(element.documentDataValue);
            break;

            case 'env_work_psb_1':
              envWorkPsb1.value = value(element.documentDataValue);
            break;

            case 'env_work_psb_2':
              envWorkPsb2.value = value(element.documentDataValue);
            break;

            case 'env_work_psb_3':
              envWorkPsb3.value = value(element.documentDataValue);
            break;

            case 'mgt_work_psb_1':
              mgtWorkPsb1.value = value(element.documentDataValue);
            break;

            case 'mgt_work_psb_2':
              mgtWorkPsb2.value = value(element.documentDataValue);
            break;

            case 'mgt_work_psb_3':
              mgtWorkPsb3.value = value(element.documentDataValue);
            break;

            case 'chck_ymd':
              chckYmd.value = DateTime.parse(value(element.documentDataValue));
            break;
          }

          // 점검일자
          // if (element.documentColumnValue == 'chck_ymd') {
          //   chckYmd.value = DateTime.parse(value(element.documentDataValue));
          // }
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

  /// 작업전후 안전회의 및 위험성평가 후 교육일지 - insert
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
      data['data_version'] = dataVersion.value;
      data['view_version'] = viewVersion.value;

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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '작업전후 안전회의 및 위험성평가 후 교육일지 저장(insert) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 작업전후 안전회의 및 위험성평가 후 교육일지 - update
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '작업전후 안전회의 및 위험성평가 후 교육일지 저장(update) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}