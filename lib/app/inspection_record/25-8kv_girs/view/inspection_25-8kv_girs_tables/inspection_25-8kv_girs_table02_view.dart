import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable02ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable02ViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('No')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('점검내용')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        child: Ui.inspectionTitleText('점검결과')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        child: Ui.inspectionTitleText('비고')
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rlb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('검전 및 접지, 사/활선 구획 로프 설치(사/활선 착각)')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['chck_rslt_2-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_2-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rlb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('안전회의 시행 및 위험성체크리스트 활용')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['chck_rslt_2-2'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_2-2'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rlb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('3')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('안전모, 안전화 등 개인별 안전장구 착용상태')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['chck_rslt_2-3'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_2-3'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rlb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('4')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('작업통보서 지참 및 작업내용 숙지')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['chck_rslt_2-4'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_2-4'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}