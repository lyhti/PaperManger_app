import 'package:dio/dio.dart' as dio;

import './base_repository.dart';
import '../model/document_data_model.dart';
import '../common/util.dart';
import '../common/ui.dart';

import 'package:get/get.dart';

class DocumentDataRepository extends BaseRepository {
  /// 문서 데이터 불러오기
  Future getDocData (String docSn) async {
    var queryParameters = {
      'doc_sn': docSn.toString()
    };

    Uri uri = getApiBaseUri('getDocData').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    print('aaa');
    print(response);

    if (response.data['success'] == true) {
      Util.print('문서 데이터 조회 : ${response.data['data']}');
      return response.data['data'].map<DocumentData>((obj) => DocumentData.fromJson(obj)).toList();
    } else {
      Util.print('문서 데이터 조회 실패 : ${response.data['message']}');
    }
  }

  /// 문서 데이터 insert
  Future<String> insertDocData (Map<String, dynamic> test) async {
    dio.FormData formData = dio.FormData.fromMap(test);
    Uri uri = getApiBaseUri('insertDocData');

    Util.print(uri.toString());

    httpClient!.options.contentType = 'multipart/form-data';
    httpClient!.options.maxRedirects.isFinite;

    var response = await httpClient!.postUri(uri, data: formData, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('문서 데이터 insert : ${response.data}');
      return "success";
    } else {
      Util.print('문서 데이터 insert 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 저장(insert) 중 에러가 발생하였습니다.'));
      return "fail";
    }
  }

  /// 문서 데이터 update
  Future<String> updateDocData (Map<String, dynamic> test) async {
    dio.FormData formData = dio.FormData.fromMap(test);
    Uri uri = getApiBaseUri('updateDocData');

    Util.print(uri.toString());

    httpClient!.options.contentType = 'multipart/form-data';
    httpClient!.options.maxRedirects.isFinite;

    var response = await httpClient!.postUri(uri, data: formData, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('문서 데이터 update : ${response.data}');
      return "success";
    } else {
      Util.print('문서 데이터 update 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 저장(update) 중 에러가 발생하였습니다.'));
      return "fail";
    }
  }
}