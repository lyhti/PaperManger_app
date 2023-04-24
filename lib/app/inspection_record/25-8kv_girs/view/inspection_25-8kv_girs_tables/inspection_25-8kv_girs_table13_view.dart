import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable13ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable13ViewWidget({Key? key}) : super(key: key);

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
                        width: 130,
                        child: Ui.inspectionTitleText('구 분')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('기    준(Ω)')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('측정치(Ω)')
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
                                width: 130,
                                child: Ui.inspectionTitleText('Close Coil')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_13-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_13-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_13-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                )
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_13-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['msrm_13-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_13-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                )
                            ),
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
                                    value: controller.textController['chck_rslt_13-1']!.text.isEmpty ? null : controller.textController['chck_rslt_13-1']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_13-1']?.text = value.toString();
                                      // '해당없음' 선택 시, 기준 및 측정치 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('crtr_13-1')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_13-1')) {
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
                                width: 130,
                                child: Ui.inspectionTitleText('Trip Coil')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_13-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['crtr_13-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_13-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(
                                    crud: controller.textController['chck_rslt_13-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                                    borderType: "rb"
                                ),
                                alignment: Alignment.center,
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['msrm_13-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.textController['chck_rslt_13-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                                ),
                            ),
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
                                    value: controller.textController['chck_rslt_13-2']!.text.isEmpty ? null : controller.textController['chck_rslt_13-2']?.text,
                                    items: List.generate(controller.checkResultList.length, (index) {
                                      return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.checkResultList[index],
                                          child: Ui.inspectionTitleText(controller.checkResultList[index])
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['chck_rslt_13-2']?.text = value.toString();
                                      // '해당없음' 선택 시, 기준 및 측정치 비활성화
                                      if (value == '해당없음') {
                                        controller.textController.forEach((key, value) {
                                          if (key.contains('crtr_13-2')) {
                                            controller.textController[key]?.text = '';
                                          }
                                          if (key.contains('msrm_13-2')) {
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
                        height: 120,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_13'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            minLines: 1,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            readOnly: controller.readOnlyYn.value
                        )
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