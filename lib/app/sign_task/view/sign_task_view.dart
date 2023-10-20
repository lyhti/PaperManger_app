import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../common/circular_loading_widget.dart';
import '../../../common/log.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/sub_app_bar_widget.dart';
import '../../../common/util.dart';
import '../../../common/ui.dart';
import '../../../services/auth_service.dart';
import '../../../services/global_service.dart';
import '../controller/sign_task_controller.dart';

import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignTaskView extends GetView<SignTaskController> {
  final auth = Get.find<AuthService>();
  final global = Get.find<GlobalService>();

  SignTaskView({Key? key}) : super(key: key);

  int taskSn = Get.arguments['taskSn'];
  int documentSn = Get.arguments['documentSn'];
  String documentTypeNm = Get.arguments['documentTypeNm'];
  String cstrnNm = Get.arguments['cstrnNm'];
  String taskDesc = Get.arguments['taskDesc'];
  String userNm = Get.arguments['userNm'];
  int confirmed = Get.arguments['confirmed'];
  String taskStatus = Get.arguments['taskStatus'];
  String signVarName = Get.arguments['signVarName'];

  @override
  Widget build(BuildContext context) {

    controller.confirmed.value = confirmed == 1 ? true : false;
    controller.signTaskSn = taskSn;
    controller.signVarName = signVarName;
    controller.documentSn = documentSn;

    return Scaffold(
      appBar: SubAppBarWidget(appBar: AppBar(), subTitle: '사인 요청'),
      endDrawer: MenuButtonWidget(),
      body: SingleChildScrollView(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 1.0,
          maxScale: 4,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('문서종류', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(documentTypeNm, style: const TextStyle(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('공사명', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(cstrnNm, style: const TextStyle(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('작업내용', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(taskDesc, style: const TextStyle(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('작성자', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(userNm, style: const TextStyle(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('확인여부', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Row(
                            children: [
                              Obx(() => Checkbox(
                                value: controller.confirmed.value, 
                                onChanged: (value) {
                                  controller.confirmed.value = value!;
                                }
                              ),),
                              const Text('내용을 확인하였습니다.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('상태', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(taskStatus, style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0, color: Colors.black),
                              bottom: BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 150,
                          child: const Text('사인', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            var sign = await Get.toNamed('/signature_page',
                                arguments: {
                                  'doc_type' : controller.docType,
                                  'title' : '작업자'
                                }
                            );
                            if (sign != null) {
                              controller.imageUrl[signVarName] = sign;
                            }
                          },
                          child: Obx(() => Container(
                              // constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                              // decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1.0, color: Colors.black),
                                  bottom: BorderSide(width: 1.0, color: Colors.black),
                                ),
                              ),
                              height: 40,
                              alignment: Alignment.center,
                              child: controller.imageUrl[signVarName] == null
                                  ?
                              const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                  :
                              (controller.imageUrl[signVarName].runtimeType.toString() == "_File"
                                  ?
                              Image.file(File(controller.imageUrl[signVarName].path),
                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                  }
                              )

                                  :
                              Image.network((global.global.value.apiFilePath! + controller.imageUrl[signVarName]),
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                      color: Ui.commonColors(),
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                },
                              ))
                          ),),
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if(!controller.confirmed.value) {
                        Util.alert('확인여부를 체크해 주세요.', callback: () {});
                      } else if(controller.imageUrl[signVarName] == null) {
                        Util.alert('사인해 주세요.', callback: () {});
                      } else {
                        // save 
                        controller.saveSignTaskData();
                        Get.offAllNamed('/home');
                      }
                    }, 
                    child: const Text('완료'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}