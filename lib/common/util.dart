import 'dart:async';
import 'dart:convert' as convert;

import '../model/user_model.dart';
import '../repositories/user_repository.dart';
import '../services/auth_service.dart';
import './ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Util {
  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  static neverSatisfied(BuildContext context, String data) async {
    return showDialog<void>(
      //다이얼로그 위젯 소환
      context: context,
      barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('제목'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: SingleChildScrollView(
            child: ListBody(
              //List Body를 기준으로 Text 설정
              children: <Widget>[
                Text(data)
              ],
            ),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Ui.commonColors())),
              child: const Text('확인', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// 알림창
  static void alert(String content,
      {String title = "알림",
        String okButtonName = "확인",
        Function? callback,
        double size = 16}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Flexible(
                child: Text(
                  content,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: const Color(0xdd000000),
                    fontSize: size,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 25),
            Row(
              children: [
                const SizedBox(width: 50),
                Expanded(
                  child: MaterialButton(
                    height: 42,
                    color: Ui.commonColors(),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      Get.back();
                      if (callback != null) {
                        await callback();
                      }
                    },
                    child: Text(
                      okButtonName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  /// 확인창
  static void confirm(String content,
      {String okButtonName = "확인",
        String cancelButtonName = "취소",
        Function? callback,
        Function? cancelCallback}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Flexible(
                child: Text(
                  content,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xdd000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 42,
                    // color: const Color(0xff00a59d),
                    color: Ui.commonColors(),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onPressed: () async {
                      Get.back();
                      if (callback != null) {
                        await callback();
                      }
                    },
                    child: Text(
                      okButtonName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    height: 42,
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () async {
                      Get.back();
                      if (cancelCallback != null) {
                        await cancelCallback();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      cancelButtonName,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  //
  // 페이지 전체 Loader
  //
  // WillPopScope (취소키 방지)
  //  1) Scaffold를 WillPopScope로 감싸준다
  //  2) onWillPop return false
  //  3) onWillPop 안에 조건 추가 가능
  //
  static overlayLoaderStart(context) {
    return Loader.show(context,
        isSafeAreaOverlay: true,
        isBottomBarOverlay: true,
        // overlayFromBottom: 80,
        overlayColor: Colors.black38,     // overlay 시 배경
        progressIndicator: CircularProgressIndicator(
          color: Ui.commonColors(),
          backgroundColor: Colors.white,
          strokeWidth: 5.0,       // line width : defalut = 4.0
        ),
        themeData: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red))
    );
  }

  static overlayLoaderStop() {
    // return Future.delayed(const Duration(milliseconds: 2000), (){
    //   Loader.hide();
    // });
    return Loader.hide();
  }

  /// 일부 위젯만 Loader
  static circularLoader(double width, double height) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Ui.commonColors(),
              // strokeWidth: 5,       // loader 선 두께.
            ),
          )
        ],
      ),
    );
  }

  static void print(dynamic message) {
    try {
      Get.log(
          '[${DateFormat.Hms().format(DateTime.now())}] <================================ $message');
    } catch (e) {
      print(message.toString());
    }
  }

  /** login token check */
  static tokenChk() async {
    final auth = Get.find<AuthService>();
    UserRepository userRepository = UserRepository();

    try {
      if (auth.tokenYn.value) {
        var result = await userRepository.getToken(auth.user.value.email.toString());

        if (result == 'false') {
          Util.print('해당 아이디 없음');
          Util.alert('로그인 정보가 해제 되었습니다.\n다시 로그인 해주시기 바랍니다.', callback: () async {
            // login token 해제
            auth.user.value = User();
            auth.tokenYn.value = false;
            auth.box.remove('login');

            Get.offAllNamed('/login');
          });
        } else {
          if (result == auth.user.value.apiToken) {
            Util.print('!! api_token 일치 !!');
            return 'agree';
          } else {
            Util.print('!! api_token 불일치 !!');
            Util.alert('다른 기기에서 접속하였습니다.\n로그인 정보가 해제됩니다.', callback: () async {
              // login token 해제
              auth.user.value = User();
              auth.tokenYn.value = false;
              auth.box.remove('login');

              Get.offAllNamed('/login');
            });
          }
        }
      } else {
        Get.offAllNamed('/login');
      }
    } catch (e) {
      if (e.toString().toLowerCase().contains('connection refused') || e.toString().toLowerCase().contains('connecting timed out')) {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: '서버와 연결이 끊어졌습니다.\n잠시 후 다시 실행해주시기 바랍니다.'));
        throw Exception(e);
      } else {
        if(Loader.isShown) {Loader.hide();}
        Get.showSnackbar(Ui.ErrorSnackBar(message: 'token 조회 중 에러가 발생하였습니다.'));
        throw Exception(e);
      }
    }
  }
}