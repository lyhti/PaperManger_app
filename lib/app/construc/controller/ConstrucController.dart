import 'package:async_foreach/async_foreach.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../../../model/document_column_model.dart';
import '../../../repositories/document_column_repository.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../repositories/document_data_repository.dart';
import '../../../model/document_data_model.dart';
import '../../../services/auth_service.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';

class ConstrucController extends GetxController with GetTickerProviderStateMixin {
  DocumentDataRepository documentDataRepository = DocumentDataRepository();
  DocumentColumnRepository documentColumnRepository = DocumentColumnRepository();
  ScrollController scrollController = ScrollController();
  TabController? tabController;

  final auth = Get.find<AuthService>();
  final textController = <String, TextEditingController>{}.obs;
  final focusNode = <String, FocusNode>{}.obs;

  final isLoading = true.obs;
  final readOnlyYn = false.obs;

  List<Tab> tabs = <Tab>[].obs ;

  final crud = 'crud-r'.obs;
  final docType = ''.obs;
  final tabCnt = 0.obs;
  final docSn = 0.obs;
  final chckYmd = DateTime.now().obs;

  final imageUrl = <String, dynamic>{}.obs;

  // 모델 선언
  final docDataList = <DocumentData>[].obs;
  final docColList = <DocumentColumn>[].obs;

  final paddingValue = 10.obs;
  final buttonAreaHeight = 40.obs;
  final titleAreaHeight = 40.obs;
  final photoAspectRatio = 1.2.obs;
  final safeAreaHeight = 20.obs;
  final gridCellNumber = 6.obs;

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
      tabController = TabController(vsync: this, length: tabCnt.value, animationDuration: const Duration(milliseconds: 700), initialIndex: 0);

      docColList.clear();
      crud.value = Get.arguments['crud'];
      docType.value = Get.arguments['doc_type'];

      /** 문서 컬럼 불러오기 */
      List<DocumentColumn> result = await documentColumnRepository.getDocColList(docType.value);

      docColList.assignAll(result);
      docColList.refresh();

      /** TextEditingController 선언 */
      await docColList.asyncForEach((item) async {
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
      tabCnt.value = 0;
      tabs.clear();

      /** TabController 초기화 */
      tabController = TabController(vsync: this, length: tabCnt.value, animationDuration: const Duration(milliseconds: 700), initialIndex: 0);

      /** TextField 초기화 */
      await docColList.asyncForEach((item) async {
        textController[item.documentColumnValue.toString()] = await TextEditingController();
      });

      if (crud.value != 'crud-c') {
        Util.print('성공성공');

        docSn.value = Get.arguments['doc_sn'];
        await getDocData();
        tabCnt.value = Get.arguments['tab_cnt'];
      } else {
        Util.print('없음없음');
        tabCnt.value = 1;
      }

      /** TabBar GetBuilder 사용으로 인한 TabController 재선언 */
      for (var i = 1; i <= tabCnt.value; i++) {
        tabs.add(Tab(text: "#$i"));
      }
      tabController = TabController(vsync: this, length: tabCnt.value, animationDuration: const Duration(milliseconds: 700), initialIndex: 0);

      update();     // GetBuilder 사용으로 인한 update 처리

      /** 0.7초 지연 후 로더 지우기 */
      if (isLoading.value) {
        await Future.delayed(const Duration(milliseconds: 700), () {
          isLoading.value = false;
          if(Loader.isShown) {Loader.hide();}
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
          imageUrl[item.documentColumnValue.toString()] = await value(item.documentDataValue);
        } else {
          textController[item.documentColumnValue.toString()] = await TextEditingController(text: value(item.documentDataValue));

          if (item.documentColumnValue == "chck_ymd") {
            chckYmd.value = await DateTime.parse(textController['chck_ymd']!.text);
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '시공사진 조회 중 에러가 발생하였습니다.'));
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

  /// 탭 추가
  Future addTabs() async {
    try {
      isLoading.value = true;

      tabCnt.value += 1;
      /** TabBar GetBuilder 사용으로 인한 tab 재선언 */
      tabs.add(Tab(child: Text('#${tabs.length+1}')));
      tabController = TabController(vsync: this, length: tabCnt.value, animationDuration: const Duration(milliseconds: 700), initialIndex: (tabs.length-1));
      update();     // GetBuilder 사용으로 인한 update 처리

      /** 0.1초 지연 후 로더 지우기 */
      if (isLoading.value) {
        await Future.delayed(const Duration(milliseconds: 100), () {
          isLoading.value = false;
          if(Loader.isShown) {Loader.hide();}
        });
      }
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '시공사진 페이지 추가 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 탭 삭제
  Future delTabs() async {
    try {
      isLoading.value = true;

      var selTab = tabController!.index;

      if ((selTab+1) < tabs.length) {
        for (var i = (selTab+2); i <= tabs.length; i++) {
          for (var j = 1; j <= 6; j++) {
            textController['sub_title_${i-1}-$j']?.text = textController['sub_title_$i-$j']!.text;
            textController['sub_title_$i-$j']!.clear();    // 초기화

            imageUrl["photo_file_nm_${i-1}-$j"] = imageUrl["photo_file_nm_$i-$j"];
            imageUrl["photo_file_nm_$i-$j"] = '';         // 초기화
          }
        }
      }

      tabCnt.value -= 1;
      tabs.removeAt(selTab);

      /** TabBar 번호 재선언 */
      var length = tabs.length;
      tabs.clear();
      for (var i = 0; i < length; i++) {
        tabs.add(Tab(child: Text('#${i+1}')));
      }

      /** TabBar GetBuilder 사용으로 인한 tab 재선언 */
      tabController = TabController(vsync: this, length: tabCnt.value, animationDuration: const Duration(milliseconds: 700), initialIndex: 0);

      /** 0.1초 지연 후 로더 지우기 */
      if (isLoading.value) {
        await Future.delayed(const Duration(milliseconds: 100), () {
          isLoading.value = false;
          if(Loader.isShown) {Loader.hide();}
        });
      }
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '시공사진 페이지 삭제 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 시공 사진 - insert
  Future saveDocData() async {
    try {
      var data = <String, dynamic>{};

      /** text data */
      for (var item in textController.keys) {
        data[item] = await textController[item]?.text;
      }

      /** image data */
      for (var item in imageUrl.keys) {
        data[item] = await (imageUrl[item].runtimeType.toString() == "XFile" ? dio.MultipartFile.fromFileSync(imageUrl[item].path) : imageUrl[item]);
      }

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);
      data['doc_sn'] = docSn.value;
      data['doc_type'] = docType.value;
      data['tab_cnt'] = tabCnt.value;

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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '시공사진 저장(insert) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  /// 시공 사진 - update
  Future updateDocData() async {
    try {
      var data = <String, dynamic>{};

      /** text data */
      for (var item in textController.keys) {
        data[item] = await textController[item]?.text;
      }

      /** image data */
      for (var item in imageUrl.keys) {
        data[item] = await (imageUrl[item].runtimeType.toString() == "XFile" ? dio.MultipartFile.fromFileSync(imageUrl[item].path) : imageUrl[item]);
      }

      Util.print(data.toString());

      data['chck_ymd'] = DateFormat('yyyy-MM-dd').format(chckYmd.value);
      data['doc_sn'] = docSn.value;
      data['doc_type'] = docType.value;
      data['tab_cnt'] = tabCnt.value;

      var result = await documentDataRepository.updateDocData(data);

      return result;
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '시공사진 저장(update) 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}