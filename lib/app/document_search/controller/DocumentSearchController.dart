import '../../../model/document_model.dart';
import '../../../model/paging.dart';
import '../../../repositories/document_repository.dart';
import '../../../common/ui.dart';
import '../../../services/auth_service.dart';

import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DocumentSearchController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController docTypeTextController = TextEditingController();
  DocumentRepository documentRepository = DocumentRepository();

  final isLoading = false.obs;

  final auth = Get.find<AuthService>();

  // 모델 선언
  final docList = <Document>[].obs;

  // Pagination
  var docPaging = Paging().obs;
  var currentPage = 1.obs;

  var searchWord = ''.obs;                                                      // 검색어
  var startDate = DateTime.now().add(const Duration(days: -7)).obs;             // 시작날짜
  var endDate = DateTime.now().obs;                                             // 종료날짜
  var selectDocType = ''.obs;                                                   // 선택한 문서종류
  var docTypeList = ['문서전체'].obs;                                             // 문서종류 리스트
  final selectDocPaginate = ''.obs;                                             // 문서 list 갯수
  var docPaginate = ['10개', '20개', '30개', '40개', '50개'].obs;                  // 문서 List 갯수

  var tableHeight = 0.0.obs;
  var tableViewLowHeight = 0.0.obs;

  @override
  void onInit() async {
    // 문서종류 '문서전체' 포함 list
    for (var i = 0; i < auth.docTypeList.length; i++) {
      docTypeList.add(auth.docTypeList[i].documentTypeNm.toString());
    }

    await onRefresh();
    super.onInit();
  }

  onRefresh() async {
    isLoading.value = true;

    currentPage.value = 1;
    docList.clear();

    await getDocList();

    if (isLoading.value) {
      await Future.delayed(const Duration(milliseconds: 700), (){
        isLoading.value = false;
      });
    }
  }

  // 문서 불러오기
  Future getDocList() async {
    try {
      isLoading.value = true;

      tableHeight.value = 61.0 + (41.0 * (docList.isEmpty ? 5 : docList.length));
      tableViewLowHeight.value = 61.0 + (41.0 * (docList.isEmpty ? 5 : docList.length));

      var sDate = DateFormat('yyyy-MM-dd 00:00:00').format(startDate.value);
      var eDate = DateFormat('yyyy-MM-dd 23:59:59').format(endDate.value);

      // document type 약어로 변경.
      var selDocType;
      if (selectDocType.toString() == "" || selectDocType.toString() == "문서전체") {
        selDocType = "all";
      } else {
        for (var i = 0; i < auth.docTypeList.length; i++) {
          if (auth.docTypeList[i].documentTypeNm.toString() == selectDocType.toString()) {
            selDocType = auth.docTypeList[i].codeAbbreviation;
          }
        }
      }

      var paginate;
      if (selectDocPaginate.value == '') {
        paginate = '10';
      } else {
        paginate = selectDocPaginate.value.substring(0, 2);
      }

      Map<String, dynamic> result = await documentRepository.getDocList(currentPage.value, searchWord.value, sDate.toString(), eDate.toString(), selDocType, paginate);

      docPaging.value = Paging();
      docPaging.value = result['paging'];
      docList.assignAll(result['dataList']);

      docPaging.refresh();
      docList.refresh();

      if (docList.isNotEmpty) {
        tableHeight.value = 61.0 + (41.0 * docList.length);
        tableViewLowHeight.value = 61.0 + (41.0 * docList.length);
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
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 조회 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}