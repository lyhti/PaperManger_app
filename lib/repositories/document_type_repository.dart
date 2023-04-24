import 'package:get/get.dart';

import '../common/ui.dart';
import '../model/document_type_model.dart';
import '../common/util.dart';
import './base_repository.dart';

class DocumentTypeRepository extends BaseRepository {
  /// 업체별 문서종류 불러오기
  Future getDocType (int entrpsSn) async {
    var queryParameters = {
      'entrps_sn': entrpsSn.toString()
    };

    Uri uri = getApiBaseUri('getDocType').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('업체별 문서종류 조회 : ${response.data['data']}');
      return response.data['data'].map<DocumentType>((obj) => DocumentType.fromJson(obj)).toList();
    } else {
      Util.print('Auth 실패 : ${response.data['message']}');
      Get.showSnackbar(Ui.ErrorSnackBar(message: '문서종류 조회 중 에러가 발생하였습니다.'));
    }
  }
}