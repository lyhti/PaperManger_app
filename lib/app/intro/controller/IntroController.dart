import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../model/user_model.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../services/auth_service.dart';
import '../../../repositories/user_repository.dart';

class IntroController extends GetxController {
  UserRepository userRepository = UserRepository();
  final box = GetStorage();
  final auth = Get.find<AuthService>();

  @override
  Future<void> onInit() async {
    super.onInit();

    Util.print('인트로 진입');

    // 2초 뒤에 화면 이동
    Timer(const Duration(milliseconds: 2000), () async {
      /** login token check */
      String check = await Util.tokenChk();

      if (check == 'agree') {
        Get.offAllNamed('/home');
      }
    });
  }
}