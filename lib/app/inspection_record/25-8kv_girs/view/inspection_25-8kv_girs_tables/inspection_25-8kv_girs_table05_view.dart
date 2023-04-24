import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable05ViewWidget extends GetView<Inspection258kvGirsController> {

  const Inspection258kvGirsTable05ViewWidget({Key? key}) : super(key: key);

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
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('No')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('점검항목')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 350,
                        child: Ui.inspectionTitleText('점검내용')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('기준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('점검결과')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
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
                        height: 180,
                        width: 150,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('일 반'),
                            Ui.inspectionTitleText('점 검')
                          ],
                        )
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('각종 Bolt / Nut의 조임 상태'),
                                    Ui.inspectionTitleText('- 체크마크 확인 및 체크마크 표기')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-1-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-1-1']!.text.isEmpty ? null : controller.textController['chck_rslt_5-1-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-1-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-1-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-1-1'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('연결부, 활동부 등의 청소')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-1-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-1-2']!.text.isEmpty ? null : controller.textController['chck_rslt_5-1-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-1-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-1-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-1-2'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('전력케이블 및 제어케이블 인출부'),
                                    Ui.inspectionTitleText('방화구획재 시공 상태')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-1-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 2,
                                    readOnly: controller.textController['chck_rslt_5-1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-1-3']!.text.isEmpty ? null : controller.textController['chck_rslt_5-1-3']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-1-3']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-1-3')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-1-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 2,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                      ],
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
                        height: 2820,
                        width: 150,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 2820,
                        width: 150,
                        child: Ui.inspectionTitleText('메커니즘')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('메커니즘 내부 각종 발청, 마모 여부')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-2-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-1']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-1'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('CB 조작 메커니즘과 조작 Link'),
                                    Ui.inspectionTitleText('Bolt 체결상태')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-2-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-2']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-2'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('DS 조작기구 구동축 연결 Bolt 이완여부')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-2-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-3']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-3']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-3']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-3')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-3'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 320,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('DS Over-Run 여부'),
                                    Image.asset('assets/figure-5-2-4.jpg', height: 150),
                                    Ui.inspectionTitleText('Ο DS 수동조작부 상태표시점(꼭지점)'),
                                    Ui.inspectionTitleText('12시 방향 지시여부 확인'),
                                    Ui.inspectionTitleText('☞ 불일치시 다른 CB, DS 조작불가'),
                                    Ui.inspectionTitleText('Ο DS 정지는 End Position Limit S/W에'),
                                    Ui.inspectionTitleText('동작하므로 S/W 불량시 DS 조작상태 불량'),
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 320,
                                width: 150,
                                child: Ui.inspectionTitleText('12시방향'),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 320,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-4']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-4']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-4']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 320,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-2-4'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 13,
                                  keyboardType: TextInputType.multiline,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Limit SW (CB, DS)'),
                                    Ui.inspectionTitleText('- 지지/고정 상태, 탈락, 변형, 동작중 걸림 등')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-5']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-2-5']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-5']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-5']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-5']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-5')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-5'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('ES Inter-Lock 해제용 레버 복귀상태'),
                                    Ui.inspectionTitleText('- 그리스 고착여부 확인')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-6']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-2-6']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-6']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-6']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-6']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-6')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-6'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 80,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Hook의 걸림 및 마모상태, Hook Gap'),
                                    Ui.inspectionTitleText('이상 유무'),
                                    Ui.inspectionTitleText('- Trip 및 Closing Latch 접촉량 등')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 80,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('제작사'),
                                    Ui.inspectionTitleText('기준 참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 80,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-7']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-7']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-7']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 80,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-7'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 3,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 180,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('베어링 이상 유무'),
                                    Image.asset('assets/figure-5-2-8.jpg', height: 150)
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-8']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 180,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-8'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 7,
                                    readOnly: controller.textController['chck_rslt_5-2-8']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 180,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-8']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-8']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-8']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-8')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 180,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-8'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 7,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('CB, DS 각종 Link 점검'),
                                    Ui.inspectionTitleText('- 적정길이, 간격, 이탈여부 등')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('제작사'),
                                    Ui.inspectionTitleText('기준 참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-9']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-9']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-9']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-9'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 2,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 220,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('각종 축 고정장치용 핀류의 상태 및'),
                                    Ui.inspectionTitleText('이탈 여부'),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/figure-5-2-10.jpg', height: 150),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Ui.inspectionTitleText('→ 분할핀'),
                                              Ui.inspectionTitleText('→ 서클립'),
                                              Ui.inspectionTitleText('→ C링'),
                                              Ui.inspectionTitleText('→ E링 등')
                                            ],
                                          )
                                        )
                                      ],
                                    )
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-10']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 220,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-10'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 8,
                                    readOnly: controller.textController['chck_rslt_5-2-10']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 220,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-10']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-10']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-10']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-10')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 220,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-10'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 8,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 290,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('구동부 Grease 도포'),
                                    Ui.inspectionTitleText('(기존 Grease 및 이물질 제거 후)'),
                                    Ui.inspectionTitleText('- Grease 제거 / 재도포, 변색상태 등'),
                                    Image.asset('assets/figure-5-2-11.jpg', height: 150),
                                    Ui.inspectionTitleText('Ο 점검시 마다 그리스 제거 및 재도포 시행'),
                                    Ui.inspectionTitleText('Ο 제작사별 주유 권장개소 참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 290,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('유지보수업무'),
                                    Ui.inspectionTitleText('Guide - 01'),
                                    Ui.inspectionTitleText('참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 290,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-11']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-11']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-11']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 290,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-11'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 11,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 290,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Spring의 발청, 손상, 변형'),
                                    Image.asset('assets/figure-5-2-12.jpg', height: 150),
                                    Ui.inspectionTitleText('Ο 3개의 스프링으로 구성'),
                                    Ui.inspectionTitleText('→ OPEN, Closing, Wiper(조작 완충용)'),
                                    Ui.inspectionTitleText('Ο 스프링 압축 또는 이완시 길이 측정'),
                                    Ui.inspectionTitleText('→ 스프링 장력 변화 여부 판정')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 290,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('제작사'),
                                    Ui.inspectionTitleText('기준 참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 290,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-12']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-12']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-12']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 290,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-12'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 11,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 390,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Shaft 및 CAM 이상 유무'),
                                    Image.asset('assets/figure-5-2-13.jpg', height: 150),
                                    Ui.inspectionTitleText('Ο 캠은 CB ON/OFF 상태에서 자유롭게 움직여야함'),
                                    Ui.inspectionTitleText('Ο 캠 공차 불량시 보조접점 동작불량 유발'),
                                    Ui.inspectionTitleText('→ 기계적으로는 이상이 없으나, 전기적으로'),
                                    Ui.inspectionTitleText('모터 및 체인소손 유발 가능'),
                                    Ui.inspectionTitleText('Ο 공차 불일치시 캠 교체'),
                                    Ui.inspectionTitleText('Ο 캠(DS 기계적 보조접점용) 그리스 제고 및 재도포')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 390,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('캠 움직임'),
                                    Ui.inspectionTitleText('원활 여부')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 390,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-13']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-13']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-13']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 390,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-13'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 16,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 80,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Close / Trip Coil 손상 유무'),
                                    Ui.inspectionTitleText('- 고정 지지용 Spring의 유지상태'),
                                    Ui.inspectionTitleText('- 동작봉과 접점편 적정이격거리 확보')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 80,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('제작사별'),
                                    Ui.inspectionTitleText('기준 참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 80,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-14']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-14']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-14']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 80,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-14'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 3,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 110,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Motor 점검'),
                                    Ui.inspectionTitleText('(Spring Cahrger 및 DS 구동용)'),
                                    Ui.inspectionTitleText('- 동작중 이음, 온도상승, 외피변색,'),
                                    Ui.inspectionTitleText('고정상태 / 흔들림')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-15']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 110,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-15'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 3,
                                    readOnly: controller.textController['chck_rslt_5-2-15']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 110,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-15']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-15']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-15']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-15')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 110,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-15'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 3,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 210,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Dashpot 압축유 누유 여부'),
                                    Ui.inspectionTitleText('- 압축유 주입량 : 10cc'),
                                    Image.asset('assets/figure-5-2-16.jpg', height: 150)
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 210,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('제작사별'),
                                    Ui.inspectionTitleText('기준 참조')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 210,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-16']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-16']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-16']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 210,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-16'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 8,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('DS, ES 구동용 체인'),
                                    Ui.inspectionTitleText('- 탈락, 변형, 적정장력 등')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-2-17']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-2-17'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-2-17']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-17']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-17']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-17']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-2-17')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-17'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 230,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('V.I 접점마모도 측정용 지그 이상 유무'),
                                    Image.asset('assets/figure-5-2-18.jpg', height: 150),
                                    Ui.inspectionTitleText('Ο 극간격 설계값 : 제작사 기준 참고'),
                                    Ui.inspectionTitleText('Ο 지그가 설치된 설비에 해당')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                height: 230,
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('설치시'),
                                    Ui.inspectionTitleText('시   행')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 230,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-2-18']!.text.isEmpty ? null : controller.textController['chck_rslt_5-2-18']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-2-18']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 230,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['rmrk_5-2-18'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 9,
                                    keyboardType: TextInputType.multiline,
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                          ],
                        ),
                      ]
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rlb'),
                        alignment: Alignment.center,
                        height: 760,
                        width: 150,
                        child: Ui.inspectionTitleText('3')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 760,
                        width: 150,
                        child: Ui.inspectionTitleText('제어회로')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('저압회로 볼트 조임상태')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-3-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-3-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-3-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-1']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-3-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-1'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('저압회로 배선정리 상태')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-3-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-3-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-3-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-2']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-3-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-2'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('보조계전기 발열 및 탄화 유무'),
                                    Ui.inspectionTitleText('- 불량시 교체')
                                  ],
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Ui.inspectionTitleText('1회/12년'),
                                  Ui.inspectionTitleText('교체')
                                ],
                              )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-3']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-3']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-3']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-3'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 2,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 210,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('ES Lock용 접점 동작 상태'),
                                    Ui.inspectionTitleText('- Lock Pin 분리시 "딸깍" 소리 확인'),
                                    Image.asset('assets/figure-5-3-4.jpg', height: 150)
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-3-4']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 210,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-3-4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 9,
                                    readOnly: controller.textController['chck_rslt_5-3-4']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 210,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-4']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-4']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-4']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-3-4')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 210,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-4'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 9,
                                  keyboardType: TextInputType.multiline,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('CB, DS 기계적 접점(a,b 접점 상태)'),
                                    Ui.inspectionTitleText('- 기계적 a,b 보조 접점 측정')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-3-5']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-3-5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-3-5']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-5']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-5']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-5']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-3-5')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-5'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('Multi-Socket 접촉상태')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-3-6']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-3-6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-3-6']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-6']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-6']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-6']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-3-6')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-6'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 60,
                                width: 350,
                                child: Ui.inspectionTitleText('CT 및 제어회로 터미널 단자 손상 여부')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-3-7']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-3-7'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.textController['chck_rslt_5-3-7']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-7']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-7']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-7']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-3-7')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-7'],
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
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 190,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('CT 2차회로 단선여부'),
                                    Image.asset('assets/figure-5-3-8.jpg', height: 150)
                                  ],
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(borderType: 'rb'),
                              height: 190,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Ui.inspectionTitleText('유지보수업무'),
                                  Ui.inspectionTitleText('Guide - 02'),
                                  Ui.inspectionTitleText('참조')
                                ],
                              )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 190,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-3-8']!.text.isEmpty ? null : controller.textController['chck_rslt_5-3-8']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-3-8']?.text = value.toString();
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 190,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-3-8'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 8,
                                  keyboardType: TextInputType.multiline,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        height: 240,
                        width: 150,
                        child: Ui.inspectionTitleText('4')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 240,
                        width: 150,
                        child: Ui.inspectionTitleText('보조기기')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 240,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('재폐로용 LPS 접점 Pass'),
                                    Ui.inspectionTitleText('Ο 최종 가압후 감도 조절 및 3상 전압측정'),
                                    Ui.inspectionTitleText('Ο LPS 79Ry Blocking 미사용 개소 "b"접점 Common확인'),
                                    Ui.inspectionTitleText('GIS용 보조계전기 KIT(SSCR)'),
                                    Ui.inspectionTitleText('Ο SSCR 동작상태 및 램프점검'),
                                    Ui.inspectionTitleText('점검프로그램 활용한 동작상태 점검'),
                                    Ui.inspectionTitleText('Ο GIS 제작사별 Tag Program 확인'),
                                    Ui.inspectionTitleText('Ο Cable 접속용 Connector 단자 점검')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-4']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 240,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 9,
                                    readOnly: controller.textController['chck_rslt_5-4']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 240,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-4']!.text.isEmpty ? null : controller.textController['chck_rslt_5-4']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-4']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-4')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 240,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-4'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 9,
                                  keyboardType: TextInputType.multiline,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        height: 410,
                        width: 150,
                        child: Ui.inspectionTitleText('5')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 410,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('보호'),
                            Ui.inspectionTitleText('계전기')
                          ],
                        )
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 210,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('보호계전기 이상유무'),
                                    Image.asset('assets/figure-5-5-1.jpg', height: 150,),
                                    Ui.inspectionTitleText('Ο 정정표에 따른 Setting치 확인')
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-5-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 210,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-5-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 8,
                                    readOnly: controller.textController['chck_rslt_5-5-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 210,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-5-1']!.text.isEmpty ? null : controller.textController['chck_rslt_5-5-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-5-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-5-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 210,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-5-1'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 8,
                                  keyboardType: TextInputType.multiline,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.centerLeft,
                                height: 200,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('Static Type Noise Filter 설치 여부'),
                                    Image.asset('assets/figure-5-5-2.jpg', height: 150,)
                                  ],
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_5-5-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 200,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_5-5-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 8,
                                    readOnly: controller.textController['chck_rslt_5-5-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 200,
                                width: 150,
                                child: SizedBox(
                                  width: 150,
                                  child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      hint: Ui.inspectionTitleText('양호'),
                                      // getx 오류로 인한 초기 null 처리.
                                      value: controller.textController['chck_rslt_5-5-2']!.text.isEmpty ? null : controller.textController['chck_rslt_5-5-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_5-5-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준값 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_5-5-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 200,
                              width: 150,
                              child: TextField(
                                  controller: controller.textController['rmrk_5-5-2'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  minLines: 1,
                                  maxLines: 8,
                                  keyboardType: TextInputType.multiline,
                                  readOnly: controller.readOnlyYn.value
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}