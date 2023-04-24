import '../services/auth_service.dart';
import '../services/api_service.dart';
import '../services/global_service.dart';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

/**
 * 베이스 레파지토리
 */
class BaseRepository extends GetxService with ApiService{
  @override
  final globalService = Get.find<GlobalService>();
  String? baseUrl;
  String? apiPath;

  dio.Dio? httpClient;
  dio.Options? optionsNetwork;
  dio.Options? optionsCache;

  BaseRepository() {
    baseUrl = globalService.global.value.baseUrl;
    apiPath = globalService.global.value.apiPath;
    httpClient = dio.Dio();

    httpClient!.options.connectTimeout = 50000;     // 50s 서버로부터 응답 받을때까지의 시간
    httpClient!.options.receiveTimeout = 50000;     // 50s 서버로 부터 응답을 스트리밍?으로 받는 중에 연결 지속 시간

    // Header 토큰값을 추가
    if (Get.find<AuthService>().tokenYn.value == true) {
      httpClient!.options.headers['authorization'] = 'Bearer ${Get.find<AuthService>().user.value.apiToken}';
    }
  }

  // Future<BaseRepository> init() async {
  //   if (foundation.kIsWeb || foundation.kDebugMode) {
  //     optionsNetwork = dio.Options();
  //     optionsCache = dio.Options();
  //   } else {
  //     optionsNetwork = buildCacheOptions(Duration(days: 3), forceRefresh: true);
  //     optionsCache = buildCacheOptions(Duration(minutes: 10), forceRefresh: false);
  //     httpClient.interceptors.add(DioCacheManager(CacheConfig(baseUrl: globalService.global.value.)).interceptor);
  //   }
  //   return this;
  // }
}
