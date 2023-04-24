import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../controller/cqis_154kv_si_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cqis154kvSiBottomWidget extends StatelessWidget {

  const Cqis154kvSiBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Cqis154kVSiController>();

    if (controller.crud.value == 'crud-c') {
      return BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () async {
                  /** login token check */
                  String check = await Util.tokenChk();

                  if (check == 'agree') {
                    var subSttnNm = controller.textController['sub_sttn_nm']?.text;
                    var eqpNm = controller.textController['eqp_nm']?.text;

                    if (subSttnNm == null || subSttnNm == '') {
                      Util.alert('변전소명을 입력해주세요.', callback: () async {
                        controller.focusNode['sub_sttn_nm']?.requestFocus();
                      });
                    } else if (eqpNm == null || eqpNm == '') {
                      Util.alert('설비명을 입력해주세요.', callback: () async {
                        controller.focusNode['eqp_nm']?.requestFocus();
                      });
                    } else {
                      Util.overlayLoaderStart(context);
                      var result = await controller.saveDocData();
                      controller.update();
                      Util.overlayLoaderStop();

                      if (result == 'success') {
                        Util.alert('문서가 저장되었습니다.', callback: () {
                          Get.offAllNamed('/home');
                        });
                      }
                    }
                  }
                },
                child: Text('저      장', style: TextStyle(color: Ui.commonColors()))
            ),
          ],
        ),
      );
    } else if (controller.crud.value == 'crud-r') {
      return BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () async {
                  /** login token check */
                  String check = await Util.tokenChk();

                  if (check == 'agree') {
                    controller.crud.value = 'crud-u';
                    controller.readOnlyYn.value = false;
                    controller.update();
                  }
                },
                child: Text('수      정', style: TextStyle(color: Ui.commonColors()))
            ),
          ],
        ),
      );
    } else {
    // if (controller.crud.value == 'crud-u') {
      return BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () async {
                  /** login token check */
                  String check = await Util.tokenChk();

                  if (check == 'agree') {
                    var subSttnNm = controller.textController['sub_sttn_nm']?.text;
                    var eqpNm = controller.textController['eqp_nm']?.text;

                    if (subSttnNm == null || subSttnNm == '') {
                      Util.alert('변전소명을 입력해주세요.', callback: () async {
                        controller.focusNode['sub_sttn_nm']?.requestFocus();
                      });
                    } else if (eqpNm == null || eqpNm == '') {
                      Util.alert('설비명을 입력해주세요.', callback: () async {
                        controller.focusNode['eqp_nm']?.requestFocus();
                      });
                    } else {
                      Util.overlayLoaderStart(context);
                      var result = await controller.saveDocData();
                      controller.update();
                      Util.overlayLoaderStop();

                      if (result == 'success') {
                        Util.alert('문서가 저장되었습니다.', callback: () {
                          Get.offAllNamed('/home');
                        });
                      }
                    }
                  }
                },
                child: const Text('다른 이름 저장', style: TextStyle(color: Color(0xff007fa5)))
            ),
            TextButton(
                onPressed: () async {
                  /** login token check */
                  String check = await Util.tokenChk();

                  if (check == 'agree') {
                    var subSttnNm = controller.textController['sub_sttn_nm']?.text;
                    var eqpNm = controller.textController['eqp_nm']?.text;

                    if (subSttnNm == null || subSttnNm == '') {
                      Util.alert('변전소명을 입력해주세요.', callback: () async {
                        controller.focusNode['sub_sttn_nm']?.requestFocus();
                      });
                    } else if (eqpNm == null || eqpNm == '') {
                      Util.alert('설비명을 입력해주세요.', callback: () async {
                        controller.focusNode['eqp_nm']?.requestFocus();
                      });
                    } else {
                      Util.overlayLoaderStart(context);
                      var result = await controller.updateDocData();
                      controller.update();
                      Util.overlayLoaderStop();

                      if (result == 'success') {
                        Util.alert('문서가 저장되었습니다.', callback: () {
                          Get.offAllNamed('/home');
                        });
                      }
                    }
                  }
                },
                child: Text('저      장', style: TextStyle(color: Ui.commonColors()))
            ),
          ],
        ),
      );
    }
  }
}
