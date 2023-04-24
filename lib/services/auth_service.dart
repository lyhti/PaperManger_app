import '../model/document_type_model.dart';
import '../common/ui.dart';
import '../model/user_model.dart';
import '../common/util.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final user = User().obs;
  final docTypeList = <DocumentType>[].obs;
  RxBool tokenYn = false.obs;
  final box = GetStorage();

  Future<AuthService> init() async {
    try {
      if (box.read('login') != null) {
        Util.print("login 정보 있음");
        user.value = User.fromJson(box.read('login'));
        tokenYn.value = true;
      } else {
        Util.print("login 정보 없음");
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'App 정보 불러오기 중 에러가 발생하였습니다.'));
      throw Exception(e);
    }
    return this;
  }
}
