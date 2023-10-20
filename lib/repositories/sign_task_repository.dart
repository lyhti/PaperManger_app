import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import '../common/log.dart';
import '../common/ui.dart';
import '../common/util.dart';
import '../model/paging.dart';
import '../model/sign_task_model.dart';
import './base_repository.dart';

class SignTaskRepository extends BaseRepository {
  /// sign task 불러오기
  Future getSignTaskList (int page, String searchWord, String sDate, String eDate, String docType, String selectDocPaginate) async {
    var queryParameters = {
      'page': page.toString(),
      'search_word': searchWord,
      'start_date': sDate,
      'end_date': eDate,
      'doc_type': docType,
      'paginate' : selectDocPaginate
    };

    Uri uri = getApiBaseUri('getSignTaskList').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('Sign Task List 조회 : ${response.data['data']}');

      var data = <String, dynamic>{};
      data['paging'] = Paging.fromJson(response.data['data']);
      data['dataList'] = response.data['data']['data'].map<SignTask>((obj) => SignTask.fromJson(obj)).toList();

      logger.d(data);

      return data;
    } else {
      Util.print('Auth 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'Sign Task 조회 중 에러가 발생하였습니다.'));
    }
  }  

  /// 문서 데이터 update
  Future<String> updateSignTaskData (Map<String, dynamic> test) async {
    logger.d('updateSignTaskData');
    dio.FormData formData = dio.FormData.fromMap(test);
    Uri uri = getApiBaseUri('updateSignTaskData');

    Util.print(uri.toString());

    httpClient!.options.contentType = 'multipart/form-data';
    httpClient!.options.maxRedirects.isFinite;

    logger.d(uri);
    logger.d(formData);

    var response = await httpClient!.postUri(uri, data: formData, options: optionsCache);

    logger.d(response);
    logger.d(response.data);

    if (response.data['success'] == true) {
      Util.print('사인 데이터 update : ${response.data}');
      return "success";
    } else {
      Util.print('사인 데이터 update 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '사인 저장(update) 중 에러가 발생하였습니다.'));
      return "fail";
    }
  }
}