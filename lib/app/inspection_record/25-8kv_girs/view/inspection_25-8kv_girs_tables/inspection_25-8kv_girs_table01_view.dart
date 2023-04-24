import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable01ViewWidget extends GetView<Inspection258kvGirsController> {

  const Inspection258kvGirsTable01ViewWidget({Key? key}) : super(key: key);

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
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: Ui.boxDecoration(),
                      height: 60,
                      width: 100,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('No')
                      ),
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "trb"),
                        alignment: Alignment.center,
                        height: 60,
                        width: 300,
                        child: Ui.inspectionTitleText('구분')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "trb"),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('판정기준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "trb"),
                        alignment: Alignment.center,
                        height: 60,
                        width: 420,
                        child: Ui.inspectionTitleText('측정값')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "trb"),
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        child: Ui.inspectionTitleText('점검결과')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "trb"),
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
                        decoration: Ui.boxDecoration(borderType: "rlb"),
                        alignment: Alignment.center,
                        height: 180,
                        width: 100,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        alignment: Alignment.centerLeft,
                        height: 180,
                        width: 300,
                        child: Ui.inspectionTitleText('부분방전 측정\n- 휴대용 TEV 측정장치 사용\n※한전 측정장치 제공시')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        alignment: Alignment.center,
                        height: 180,
                        width: 100,
                        child: Ui.inspectionTitleText('16 [dbm]\n    이하')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('CB')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-1-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-1-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-1-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('[dbm]')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['cb_chck_rslt_1-1']!.text.isEmpty ? null : controller.textController['cb_chck_rslt_1-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['cb_chck_rslt_1-1']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('cb_msrm_1-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('#1 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-1-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-1-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-1-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('[dbm]')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText("양호"),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['ds1_chck_rslt_1-1']!.text.isEmpty ? null : controller.textController['ds1_chck_rslt_1-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['ds1_chck_rslt_1-1']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('ds1_msrm_1-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('#2 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-1-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-1-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-1-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('[dbm]')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['ds2_chck_rslt_1-1']!.text.isEmpty ? null : controller.textController['ds2_chck_rslt_1-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['ds2_chck_rslt_1-1']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('ds2_msrm_1-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 180,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_1-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            minLines: 1,
                            maxLines: 7,
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
                        decoration: Ui.boxDecoration(borderType: "rlb"),
                        alignment: Alignment.center,
                        height: 180,
                        width: 100,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        alignment: Alignment.centerLeft,
                        height: 180,
                        width: 300,
                        child: Ui.inspectionTitleText('GIS 내부 이음 발생 여부\n- 청진기 사용\n※ 휴대용 TEV 측정 장비가 없을 경우')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        alignment: Alignment.center,
                        height: 180,
                        width: 100,
                        child: Ui.inspectionTitleText('무')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('CB')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-2-3'],
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['cb_chck_rslt_1-2']!.text.isEmpty ? null : controller.textController['cb_chck_rslt_1-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['cb_chck_rslt_1-2']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('cb_msrm_1-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('#1 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-2-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['ds1_chck_rslt_1-2']!.text.isEmpty ? null : controller.textController['ds1_chck_rslt_1-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['ds1_chck_rslt_1-2']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('ds1_msrm_1-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('#2 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-2-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['ds2_chck_rslt_1-2']!.text.isEmpty ? null : controller.textController['ds2_chck_rslt_1-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['ds2_chck_rslt_1-2']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('ds2_msrm_1-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 180,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_1-2'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            minLines: 1,
                            maxLines: 7,
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
                        decoration: Ui.boxDecoration(borderType: "rlb"),
                        alignment: Alignment.center,
                        height: 240,
                        width: 100,
                        child: Ui.inspectionTitleText('3')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        alignment: Alignment.centerLeft,
                        height: 240,
                        width: 300,
                        child: Ui.inspectionTitleText('GIS 표피온도 측정\n- Thermovision 사용')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        alignment: Alignment.center,
                        height: 240,
                        width: 100,
                        child: Ui.inspectionTitleText('각 상간\n차이가\n없을 것')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('CB')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-3-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-3-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['cb_msrm_1-3-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['cb_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('℃')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['cb_chck_rslt_1-3']!.text.isEmpty ? null : controller.textController['cb_chck_rslt_1-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['cb_chck_rslt_1-3']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('cb_msrm_1-3')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('#1 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-3-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-3-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds1_msrm_1-3-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds1_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('℃')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['ds1_chck_rslt_1-3']!.text.isEmpty ? null : controller.textController['ds1_chck_rslt_1-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['ds1_chck_rslt_1-3']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('ds1_msrm_1-3')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('#2 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-3-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-3-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['ds2_msrm_1-3-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['ds2_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('℃')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['ds2_chck_rslt_1-3']!.text.isEmpty ? null : controller.textController['ds2_chck_rslt_1-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['ds2_chck_rslt_1-3']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('ds2_msrm_1-3')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 100,
                                child: Ui.inspectionTitleText('인출측')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['wdrw_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['wdrw_msrm_1-3-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['wdrw_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['wdrw_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['wdrw_msrm_1-3-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['wdrw_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['wdrw_chck_rslt_1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 80,
                                child: TextField(
                                    controller: controller.textController['wdrw_msrm_1-3-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['wdrw_chck_rslt_1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: "rb"),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('℃')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['wdrw_chck_rslt_1-3']!.text.isEmpty ? null : controller.textController['wdrw_chck_rslt_1-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.checkResultList[index],
                                        child: Ui.inspectionTitleText(controller.checkResultList[index]),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['wdrw_chck_rslt_1-3']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('wdrw_msrm_1-3')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 240,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_1-3'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            minLines: 1,
                            maxLines: 10,
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