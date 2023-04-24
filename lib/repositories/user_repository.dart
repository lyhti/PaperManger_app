import './base_repository.dart';
import '../model/user_model.dart';
import '../common/util.dart';

class UserRepository extends BaseRepository {
  /// 로그인
  Future<Map<String, dynamic>> logIn (String email, String pwd) async {
    var queryParameters = {
      'email': email.toString(),
      'password': pwd.toString()
    };

    Uri uri = getApiBaseUri('logIn');

    Util.print(uri.toString());

    var response = await httpClient!.postUri(uri, data: queryParameters, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('로그인 성공 : ${response.data}');

      var data = <String, dynamic>{};
      data['success'] = response.data['success'];
      data['message'] = response.data['message'];
      data['dataList'] = User.fromJson(response.data['data']);
      data['loginList'] = response.data['data'];

      return data;
    } else {
      Util.print('로그인 실패 : ${response.data['message']}');

      var data = <String, dynamic>{};
      data['success'] = response.data['success'];
      data['message'] = response.data['message'];

      return data;
    }
  }

  /// Device 에 저장된 api-Token 값 check
  Future<String> getToken (String email) async {
    var queryParameters = {
      'email': email.toString()
    };

    Uri uri = getApiBaseUri('getToken').replace(queryParameters: queryParameters);

    Util.print(uri.toString());

    var response = await httpClient!.getUri(uri, options: optionsCache);

    if (response.data['success'] == true) {
      Util.print('getToken 성공 : ${response.data}');
      return response.data['data'];
    } else {
      Util.print('getToken 실패 : 아이디 없음');
      return response.data['success'].toString();
    }
  }

  /// 로그아웃
  Future<void> logOut (int? userSn) async {
    var queryParameters = {
      'user_sn': userSn
    };

    Uri uri = getApiBaseUri('logOut');

    Util.print(uri.toString());

    await httpClient!.postUri(uri, data: queryParameters, options: optionsCache);
  }
}