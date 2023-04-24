import '../../../common/util.dart';
import '../../../model/user_model.dart';
import '../../../services/auth_service.dart';
import '../../../common/ui.dart';
import '../../../repositories/user_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController idTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  UserRepository userRepository = UserRepository();
  final auth = Get.find<AuthService>();

  FlutterSecureStorage storage = const FlutterSecureStorage();
  final GetStorage box = GetStorage();

  //비밀번호 hide/show
  RxBool isObscure = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await onRefresh();
  }

  onRefresh() {
    idTextController.clear();
    passwordTextController.clear();
  }

  // 로그인
  Future logIn(String email, String password) async {
    try {
      Util.print("login email : ${idTextController.text}");
      Util.print("login pwd : ${passwordTextController.text}");

      Map<String, dynamic> result = await userRepository.logIn(email, password);

      if (result['dataList'] != null) {
        auth.user.value = result['dataList'];
        auth.tokenYn.value = true;
        box.write('login', result['loginList']);
        Util.print(box.read('login'));
      }

      var rtn = result['success'].toString();

      if (rtn == 'false') {
        if (result['message'].toString().contains('Email')) {
          rtn = 'Email';
        }
        if (result['message'].toString().contains('Password')) {
          rtn = 'Password';
        }
      }

      return rtn;
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        Util.overlayLoaderStop();
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        Util.overlayLoaderStop();
        Get.showSnackbar(Ui.ErrorSnackBar(message: '로그인 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }

  // 로그아웃
  Future logOut() async {
    try {
      await userRepository.logOut(auth.user.value.userSn);

      // login token 해제
      auth.user.value = User();
      auth.tokenYn.value = false;
      auth.box.remove('login');
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        Util.overlayLoaderStop();
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        Util.overlayLoaderStop();
        Get.showSnackbar(Ui.ErrorSnackBar(message: '로그아웃 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}