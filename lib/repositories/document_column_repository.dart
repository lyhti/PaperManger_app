import 'package:get/get.dart';

import '../common/ui.dart';
import '../model/document_column_model.dart';
import '../common/util.dart';
import './base_repository.dart';

class DocumentColumnRepository extends BaseRepository {
  /// 문서 컬럼 불러오기
  Future getDocColList (String docType) async {
    var queryParameters = {
      'doc_type': docType.toString()
    };

    Uri uri = getApiBaseUri('getDocColList').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('문서 컬럼 조회 : ${response.data['data']}');
      return response.data['data'].map<DocumentColumn>((obj) => DocumentColumn.fromJson(obj)).toList();
    } else {
      Util.print('Auth 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 컬럼 조회 중 에러가 발생하였습니다.'));
    }
  }

  Future getCrntDocColList (String docType) async {
    var queryParameters = {
      'doc_type': docType.toString()
    };

    Uri uri = getApiBaseUri('getCrntDocColList').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('문서 컬럼 조회 : ${response.data['data']}');
      return response.data['data'].map<DocumentColumn>((obj) => DocumentColumn.fromJson(obj)).toList();
    } else {
      Util.print('Auth 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 컬럼 조회 중 에러가 발생하였습니다.'));
    }
  }

  Future getDocColListWithVersion (String docType, int dataVersion, int viewVersion) async {
    var queryParameters = {
      'doc_type': docType.toString(),
      'data_version': dataVersion.toString(),
      'view_version': viewVersion.toString(),
    };

    Uri uri = getApiBaseUri('getDocColListWithVersion').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('문서 컬럼 조회 : ${response.data['data']}');
      return response.data['data'].map<DocumentColumn>((obj) => DocumentColumn.fromJson(obj)).toList();
    } else {
      Util.print('Auth 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 컬럼 조회 중 에러가 발생하였습니다.'));
    }
  }
}