import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable12ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable12ViewWidget({Key? key}) : super(key: key);

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
                        width: 50,
                        child: Ui.inspectionTitleText('No')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        child: Ui.inspectionTitleText('구 분')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        child: Ui.inspectionTitleText('판정기준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 280,
                        child: Ui.inspectionTitleText('측정값')
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
                        width: 200,
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
                        height: 360,
                        width: 50,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 360,
                        width: 80,
                        child: Ui.inspectionTitleText('포화특성')
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Ry용 A상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Ry용 B상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Ry용 C상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Meter용 A상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Meter용 B상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Meter용 C상')
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 180,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Ui.inspectionTitleText('200V'),
                                Ui.inspectionTitleText('이상')
                              ],
                            )
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 180,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Ui.inspectionTitleText('50V'),
                                Ui.inspectionTitleText('이상')
                              ],
                            )
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            // Ry용 A상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-1-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-1-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-1-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 40,
                                          child: Ui.inspectionTitleText('[V]')
                                      ),
                                    ]
                                ),
                            ),

                            // 포화특성 - Ry용 A상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-1-1']!.text.isEmpty ? null : controller.textController['chck_rslt_12-1-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-1-1']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-1-1')) {
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
                            // Ry용 B상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-1-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-1-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-1-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 40,
                                          child: Ui.inspectionTitleText('[V]')
                                      ),
                                    ]
                                ),
                            ),

                            // 포화특성 - Ry용 B상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-1-2']!.text.isEmpty ? null : controller.textController['chck_rslt_12-1-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-1-2']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-1-2')) {
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
                            // Ry용 C상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-1-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-1-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-1-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 40,
                                          child: Ui.inspectionTitleText('[V]')
                                      ),
                                    ]
                                ),
                            ),

                            // 포화특성 - Ry용 C상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-1-3']!.text.isEmpty ? null : controller.textController['chck_rslt_12-1-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-1-3']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-1-3')) {
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
                            // 포화특성 - Meter용 A상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-1-4']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-1-4'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-1-4']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 40,
                                          child: Ui.inspectionTitleText('[V]')
                                      ),
                                    ]
                                ),
                            ),

                            // 포화특성 - Meter용 A상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-1-4']!.text.isEmpty ? null : controller.textController['chck_rslt_12-1-4']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-1-4']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-1-4')) {
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
                            // 포화특성 - Meter용 B상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-1-5']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-1-5'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-1-5']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 40,
                                          child: Ui.inspectionTitleText('[V]')
                                      ),
                                    ]
                                ),
                            ),

                            // 포화특성 - Meter용 B상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-1-5']!.text.isEmpty ? null : controller.textController['chck_rslt_12-1-5']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-1-5']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-1-5')) {
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
                            // 포화특성 - Meter용 C상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-1-6']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-1-6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-1-6']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 40,
                                          child: Ui.inspectionTitleText('[V]')
                                      ),
                                    ]
                                ),
                            ),

                            // 포화특성 - Meter용 C상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-1-6']!.text.isEmpty ? null : controller.textController['chck_rslt_12-1-6']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-1-6']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-1-6')) {
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
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 360,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_12-1'],
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
                        height: 360,
                        width: 50,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 360,
                        width: 80,
                        child: Ui.inspectionTitleText('변 류 비')
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Ry용 A상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Ry용 B상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Ry용 C상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Meter용 A상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Meter용 B상')
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            child: Ui.inspectionTitleText('Meter용 C상')
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 180,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Ui.inspectionTitleText('120/80/40'),
                                Ui.inspectionTitleText(': 1')
                              ],
                            )
                        ),
                        Container(
                            decoration: Ui.boxDecoration(borderType: 'rb'),
                            alignment: Alignment.center,
                            height: 180,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Ui.inspectionTitleText('120/60'),
                                Ui.inspectionTitleText(': 1')
                              ],
                            )
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            // 변류비 - Ry용 A상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-2-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-1-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-1-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-1-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 30,
                                          child: Ui.inspectionTitleText(': 1')
                                      ),
                                    ]
                                ),
                            ),

                            // 변류비 - Ry용 A상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-2-1']!.text.isEmpty ? null : controller.textController['chck_rslt_12-2-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-2-1']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-2-1-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-1-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-1-3')) {
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
                            // 변류비 - Ry용 B상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-2-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-2-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-2-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-2-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 30,
                                          child: Ui.inspectionTitleText(': 1')
                                      ),
                                    ]
                                ),
                            ),

                            // 변류비 - Ry용 B상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-2-2']!.text.isEmpty ? null : controller.textController['chck_rslt_12-2-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-2-2']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-2-2-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-2-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-2-3')) {
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
                            // 변류비 - Ry용 C상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-2-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-3-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-3-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-3-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 30,
                                          child: Ui.inspectionTitleText(': 1')
                                      ),
                                    ]
                                ),
                            ),

                            // 변류비 - Ry용 C상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-2-3']!.text.isEmpty ? null : controller.textController['chck_rslt_12-2-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-2-3']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-2-3-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-3-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-3-3')) {
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
                            // 변류비 - Meter용 A상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-2-4']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-4']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-4']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-4']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 30,
                                          child: Ui.inspectionTitleText(': 1')
                                      ),
                                    ]
                                ),
                            ),

                            // 변류비 - Meter용 A상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-2-4']!.text.isEmpty ? null : controller.textController['chck_rslt_12-2-4']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-2-4']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-2-4-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-4-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-4-3')) {
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
                            // 변류비 - Meter용 B상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-2-5']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-5']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-5']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-5']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 30,
                                          child: Ui.inspectionTitleText(': 1')
                                      ),
                                    ]
                                ),
                            ),

                            // 변류비 - Meter용 B상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-2-5']!.text.isEmpty ? null : controller.textController['chck_rslt_12-2-5']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-2-5']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-2-5-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-5-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-5-3')) {
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
                            // 변류비 - Meter용 C상 측정값
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_12-2-6']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 280,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-6-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-6']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-6-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-6']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 20,
                                          child: Ui.inspectionTitleText('/')
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: TextField(
                                            controller: controller.textController['msrm_12-2-6-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_12-2-6']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 30,
                                          child: Ui.inspectionTitleText(': 1')
                                      ),
                                    ]
                                ),
                            ),

                            // 변류비 - Meter용 C상 점검결과
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    hint: Ui.inspectionTitleText('양호'),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['chck_rslt_12-2-6']!.text.isEmpty ? null : controller.textController['chck_rslt_12-2-6']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_12-2-6']?.text = value.toString();
                                      // '해당없음' 선택 시, 측정값 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('msrm_12-2-6-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-6-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_12-2-6-3')) {
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
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 360,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_12-2'],
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
                        )
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ui.inspectionTitleText('👉 외장형 CT 및 변류기 시험기 한전 제공시 → C.T 포화시험기로 측정시 측정기록지로 대신함.'),
                        Ui.inspectionTitleText('👉 내장형 CT(현대 |日형) 및 외장형 CT중 CT 내부도체 통과가 불가능한 개소는 시험생략 가능')
                      ],
                    )
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}