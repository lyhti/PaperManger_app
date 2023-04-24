import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable08ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable08ViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() => Row(
              children: [
                Column(
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
                            width: 50,
                            child: Ui.inspectionTitleText('No')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'trb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 150,
                            child: Ui.inspectionTitleText('구  분')
                        ),
                        Column(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'trb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 200,
                                child: Ui.inspectionTitleText('기  준')
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 100,
                                    child: Ui.inspectionTitleText('ON')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 100,
                                    child: Ui.inspectionTitleText('OFF')
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'trb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 200,
                                child: Ui.inspectionTitleText('측 정 값')
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 100,
                                    child: Ui.inspectionTitleText('ON')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 100,
                                    child: Ui.inspectionTitleText('OFF')
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'trb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Ui.inspectionTitleText('점 검'),
                                Ui.inspectionTitleText('결 과')
                              ],
                            )
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rlb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 50,
                                child: Ui.inspectionTitleText('1')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: Ui.inspectionTitleText('CB (kg.f/cm²)')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['crtr_on_8-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['crtr_off_8-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['msrm_on_8-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['msrm_off_8-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
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
                                      value: controller.textController['chck_rslt_8-1']!.text.isEmpty ? null : controller.textController['chck_rslt_8-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_8-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준 및 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_on_8-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('crtr_off_8-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('msrm_on_8-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('msrm_off_8-1')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
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
                                width: 50,
                                child: Ui.inspectionTitleText('2')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: Ui.inspectionTitleText('#1 DS (kg.f/cm²)')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['crtr_on_8-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['crtr_off_8-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['msrm_on_8-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['msrm_off_8-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
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
                                      value: controller.textController['chck_rslt_8-2']!.text.isEmpty ? null : controller.textController['chck_rslt_8-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_8-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준 및 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_on_8-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('crtr_off_8-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('msrm_on_8-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('msrm_off_8-2')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
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
                                width: 50,
                                child: Ui.inspectionTitleText('3')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: Ui.inspectionTitleText('#2 DS (kg.f/cm²)')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['crtr_on_8-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['crtr_off_8-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['msrm_on_8-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_8-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['msrm_off_8-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_8-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
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
                                      value: controller.textController['chck_rslt_8-3']!.text.isEmpty ? null : controller.textController['chck_rslt_8-3']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['chck_rslt_8-3']?.text = value.toString();
                                        // '해당없음' 선택 시, 기준 및 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('crtr_on_8-3')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('crtr_off_8-3')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('msrm_on_8-3')) {
                                              controller.textController[key]?.text = '';
                                            }
                                            if (key.contains('msrm_off_8-3')) {
                                              controller.textController[key]?.text = '';
                                            }
                                          });
                                        }
                                        controller.update();     // GetBuilder 사용으로 인한 update 처리
                                      }
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        child: Ui.inspectionTitleText('비 고')
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                      height: 180,
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_8'],
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
                )
              ],
            ))
          ),
        ),
      ),
    );
  }
}