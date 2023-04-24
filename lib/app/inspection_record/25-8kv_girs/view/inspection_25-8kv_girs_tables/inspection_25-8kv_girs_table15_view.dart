import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable15ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable15ViewWidget({Key? key}) : super(key: key);

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
                        width: 100,
                        child: Ui.inspectionTitleText('구    분')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('기    준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        child: Ui.inspectionTitleText('Stroke')
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
                        child: Ui.inspectionTitleText('비고')
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
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
                                width: 100,
                                child: Ui.inspectionTitleText('A상')
                            ),
                          ],
                        ),
                        Row(
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
                                width: 100,
                                child: Ui.inspectionTitleText('B상')
                            ),
                          ],
                        ),
                        Row(
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
                                width: 100,
                                child: Ui.inspectionTitleText('C상')
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 150,
                        child: Ui.inspectionTitleText('16 ± 1 mm')
                    ),
                    Column(
                      children: [
                        // A상
                        Row(
                          children: [
                            // A상 Stroke
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_15-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: TextField(
                                            controller: controller.textController['strk_15-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_15-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 50,
                                          child: Ui.inspectionTitleText('[mm]')
                                      ),
                                    ]
                                ),
                            ),

                            // A상 점검결과
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
                                    value: controller.textController['chck_rslt_15-1']!.text.isEmpty ? null : controller.textController['chck_rslt_15-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_15-1']?.text = value.toString();
                                      // '해당없음' 선택 시, Stroke 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('strk_15-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),

                            // A상 비고
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 200,
                              child: TextField(
                                  controller: controller.textController['rmrk_15-1'],
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

                        // B상
                        Row(
                          children: [
                            // B상 Stroke
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_15-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: TextField(
                                            controller: controller.textController['strk_15-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_15-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 50,
                                          child: Ui.inspectionTitleText('[mm]')
                                      ),
                                    ]
                                ),
                            ),

                            // B상 점검결과
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
                                    value: controller.textController['chck_rslt_15-2']!.text.isEmpty ? null : controller.textController['chck_rslt_15-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_15-2']?.text = value.toString();
                                      // '해당없음' 선택 시, Stroke 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('strk_15-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),

                            // B상 비고
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 200,
                              child: TextField(
                                  controller: controller.textController['rmrk_15-2'],
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

                        // C상
                        Row(
                          children: [
                            // C상 Stroke
                            Container(
                                padding: const EdgeInsets.only(left: 15.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_15-3']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                height: 60,
                                width: 200,
                                child: Row(
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: TextField(
                                            controller: controller.textController['strk_15-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                            readOnly: controller.textController['chck_rslt_15-3']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 50,
                                          child: Ui.inspectionTitleText('[mm]')
                                      ),
                                    ]
                                ),
                            ),

                            // C상 점검결과
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
                                    value: controller.textController['chck_rslt_15-3']!.text.isEmpty ? null : controller.textController['chck_rslt_15-3']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_15-3']?.text = value.toString();
                                      // '해당없음' 선택 시, Stroke 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('strk_15-3')) {
                                            controller.textController[key]?.text = '';
                                          }
                                        });
                                      }
                                      controller.update();     // GetBuilder 사용으로 인한 update 처리
                                    }
                                )
                            ),

                            // C상 비고
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: 60,
                              width: 200,
                              child: TextField(
                                  controller: controller.textController['rmrk_15-3'],
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