import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable06ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable06ViewWidget({Key? key}) : super(key: key);

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
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 300,
                        child: Ui.inspectionTitleText('구    분')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 210,
                        child: Ui.inspectionTitleText('판정기준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        child: Ui.inspectionTitleText('측 정 치')
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
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        child: Ui.inspectionTitleText('비 고')
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
                        width: 100,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 200,
                        child: Ui.inspectionTitleText('SO₂ 함유량 측정')
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 100,
                            child: Ui.inspectionTitleText('CB')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 100,
                            child: Ui.inspectionTitleText('#1 DS')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 100,
                            child: Ui.inspectionTitleText('#2 DS')
                        ),
                      ],
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 210,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('1 PPMv'),
                            Ui.inspectionTitleText('이 하')
                          ],
                        )
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_6-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                          controller: controller.textController['cb_msrm_6-1'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(5.0),
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                          readOnly: controller.textController['cb_chck_rslt_6-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 60,
                                        child: Ui.inspectionTitleText('[PPM]')
                                    ),
                                  ]
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
                                      value: controller.textController['cb_chck_rslt_6-1']!.text.isEmpty ? null : controller.textController['cb_chck_rslt_6-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['cb_chck_rslt_6-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('cb_msrm_6-1')) {
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
                                  controller: controller.textController['cb_rmrk_6-1'],
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
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_6-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                            controller: controller.textController['ds1_msrm_6-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['ds1_chck_rslt_6-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 60,
                                          child: Ui.inspectionTitleText('[PPM]')
                                      ),
                                    ]
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
                                      value: controller.textController['ds1_chck_rslt_6-1']!.text.isEmpty ? null : controller.textController['ds1_chck_rslt_6-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['ds1_chck_rslt_6-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('ds1_msrm_6-1')) {
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
                                    controller: controller.textController['ds1_rmrk_6-1'],
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
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_6-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                            controller: controller.textController['ds2_msrm_6-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['ds2_chck_rslt_6-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 60,
                                          child: Ui.inspectionTitleText('[PPM]')
                                      ),
                                    ]
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
                                      value: controller.textController['ds2_chck_rslt_6-1']!.text.isEmpty ? null : controller.textController['ds2_chck_rslt_6-1']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['ds2_chck_rslt_6-1']?.text = value.toString();
                                        // '해당없음' 선택 시, 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('ds2_msrm_6-1')) {
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
                                    controller: controller.textController['ds2_rmrk_6-1'],
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
                        width: 100,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 200,
                        child: Ui.inspectionTitleText('수분 함유량 측정')
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 100,
                            child: Ui.inspectionTitleText('CB')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 100,
                            child: Ui.inspectionTitleText('#1 DS')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 100,
                            child: Ui.inspectionTitleText('#2 DS')
                        ),
                      ],
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 210,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('Ο CB'),
                            Ui.inspectionTitleText('- 관리치 : 200PPMv 이하'),
                            Ui.inspectionTitleText('- 허용치 : 300PPMv 이하'),
                            Ui.inspectionTitleText('Ο 기타'),
                            Ui.inspectionTitleText('- 관리치 : 300PPMv 이하'),
                            Ui.inspectionTitleText('- 허용치 : 1000PPMv 이하')
                          ],
                        )
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['cb_chck_rslt_6-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                            controller: controller.textController['cb_msrm_6-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['cb_chck_rslt_6-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 60,
                                          child: Ui.inspectionTitleText('[PPM]')
                                      ),
                                    ]
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
                                      value: controller.textController['cb_chck_rslt_6-2']!.text.isEmpty ? null : controller.textController['cb_chck_rslt_6-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['cb_chck_rslt_6-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('cb_msrm_6-2')) {
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
                                    controller: controller.textController['cb_rmrk_6-2'],
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
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds1_chck_rslt_6-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                            controller: controller.textController['ds1_msrm_6-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['ds1_chck_rslt_6-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 60,
                                          child: Ui.inspectionTitleText('[PPM]')
                                      ),
                                    ]
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
                                      value: controller.textController['ds1_chck_rslt_6-2']!.text.isEmpty ? null : controller.textController['ds1_chck_rslt_6-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['ds1_chck_rslt_6-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('ds1_msrm_6-2')) {
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
                                    controller: controller.textController['ds1_rmrk_6-2'],
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
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['ds2_chck_rslt_6-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: TextField(
                                            controller: controller.textController['ds2_msrm_6-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['ds2_chck_rslt_6-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 60,
                                          child: Ui.inspectionTitleText('[PPM]')
                                      ),
                                    ]
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
                                      value: controller.textController['ds2_chck_rslt_6-2']!.text.isEmpty ? null : controller.textController['ds2_chck_rslt_6-2']?.text,
                                      items: List.generate(controller.checkResultList.length, (index) {
                                        return DropdownMenuItem(
                                            alignment: AlignmentDirectional.center,
                                            value: controller.checkResultList[index],
                                            child: Ui.inspectionTitleText(controller.checkResultList[index])
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['ds2_chck_rslt_6-2']?.text = value.toString();
                                        // '해당없음' 선택 시, 측정치 비활성화
                                        if (value == '해당없음') {
                                          controller.textController.forEach((key, value) {
                                            if (key.contains('ds2_msrm_6-2')) {
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
                                    controller: controller.textController['ds2_rmrk_6-2'],
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