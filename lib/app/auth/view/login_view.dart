import '../../empty_view.dart';

import '../../../common/ui.dart';
import '../../../services/auth_service.dart';
import '../../../common/util.dart';
import '../controller/LoginController.dart';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class LoginViewWidget extends GetView<LoginController> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final auth = Get.find<AuthService>();

  LoginViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Paper Manager', style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: InteractiveViewer(
          panEnabled: true,
          minScale: 1.0,
          maxScale: 4,
          child: SafeArea(
            child: Form(
              key: _loginFormKey,
              child: Obx(() => Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.idTextController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '아이디입력',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.idTextController.clear();
                              },
                              icon: const Icon(Icons.clear),
                            ),
                            errorStyle: const TextStyle(height: 0),
                          ),
                          //autofocus: true,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                          ),
                          validator: (input) {
                            if (input == null || input.trim().isEmpty) {
                              return '아이디를 입력하세요.';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(input)) {
                              return '이메일 형식으로 입력해주세요.';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          controller: controller.passwordTextController,
                          obscureText: controller.isObscure.value,
                          decoration: InputDecoration(
                            hintText: '비밀번호입력',
                            suffixIcon: IconButton(
                                icon: Icon(controller.isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  controller.isObscure.value =
                                      !controller.isObscure.value;
                                }),
                            errorStyle: const TextStyle(height: 0),
                          ),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (input) {
                            if (input == null || input.trim().isEmpty) {
                              return '비밀번호를 입력하세요.';
                            }
                            if (input.length < 6) {
                              return '비밀번호는 최소 6글자 이상 입니다.';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Get.offAllNamed('/home');
                            //   },
                            //   child: const Text('회원가입'),
                            // ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (_loginFormKey.currentState!.validate()) {
                                    _loginFormKey.currentState!.save();
                                    Util.overlayLoaderStart(context);
                                    var result = await controller.logIn(controller.idTextController.text, controller.passwordTextController.text);

                                    if (result == "Email") {
                                      Util.overlayLoaderStop();
                                      Util.alert('둥록 되지 않은 아이디 입니다.');
                                    }

                                    if (result == 'Password') {
                                      Util.overlayLoaderStop();
                                      Util.alert('비밀번호가 일치하지 않습니다.\n다시 확인해주시기 바랍니다.');
                                    }

                                    if (result == 'true') {
                                      Util.overlayLoaderStop();
                                      Get.offAllNamed('/home');
                                    }
                                  }
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Ui.commonColors())),
                                child: const Text('로그인')
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        print("아직 실행 중 입니다.");
        return !Loader.isShown;
      },
    );
  }
}
