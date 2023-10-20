import 'package:get/get.dart';

import '../common/log.dart';
import '../common/ui.dart';
import '../model/document_model.dart';
import '../common/util.dart';
import '../model/paging.dart';
import './base_repository.dart';

class DocumentRepository extends BaseRepository {
  /// 문서 불러오기
  Future getDocList (int page, String searchWord, String sDate, String eDate, String docType, String selectDocPaginate) async {
    var queryParameters = {
      'page': page.toString(),
      'search_word': searchWord,
      'start_date': sDate,
      'end_date': eDate,
      'doc_type': docType,
      'paginate' : selectDocPaginate
    };

    Uri uri = getApiBaseUri('getDocList').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('업체별 문서종류 조회 : ${response.data['data']}');

      var data = <String, dynamic>{};
      data['paging'] = Paging.fromJson(response.data['data']);
      data['dataList'] = response.data['data']['data'].map<Document>((obj) => Document.fromJson(obj)).toList();

      logger.d(data);

      return data;
    } else {
      Util.print('Auth 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서 조회 중 에러가 발생하였습니다.'));
    }
  }
}