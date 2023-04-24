import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable16ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable16ViewWidget({Key? key}) : super(key: key);

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
                        width: 50,
                        child: Ui.inspectionTitleText('No')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        child: Ui.inspectionTitleText('구    분')
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: Ui.boxDecoration(borderType: 'trb'),
                          alignment: Alignment.center,
                          height: 30,
                          width: 280,
                          child: Ui.inspectionTitleText('점  검  전')
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('A')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('B')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('C')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('N')
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
                            width: 280,
                            child: Ui.inspectionTitleText('점  검  후')
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('A')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('B')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('C')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 30,
                                width: 70,
                                child: Ui.inspectionTitleText('N')
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
                        width: 50,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        child: Ui.inspectionTitleText('부하전류')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-2'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-3'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-4'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-5'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-6'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-7'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-1']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-1-8'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-1']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
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
                            value: controller.textController['chck_rslt_16-1']!.text.isEmpty ? null : controller.textController['chck_rslt_16-1']!.text,
                            items: List.generate(controller.checkResultList.length, (index) {
                              return DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: controller.checkResultList[index],
                                  child: Ui.inspectionTitleText(controller.checkResultList[index])
                              );
                            }),
                            onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                              controller.textController['chck_rslt_16-1']?.text = value.toString();
                              // '해당없음' 선택 시, 점검전/후 비활성화
                              if (value == '해당없음') {
                                controller.textController.forEach((key, value) {
                                  if (key.contains('value_16-1-1')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-2')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-3')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-4')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-5')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-6')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-7')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-1-8')) {
                                    controller.textController[key]?.text = '';
                                  }
                                });
                              }
                              controller.update();     // GetBuilder 사용으로 인한 update 처리
                            }
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_16-1'],
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
                        child: Ui.inspectionTitleText('LPS 점등상태')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-2-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-2-2'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-2-3'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                        height: 60,
                        width: 70
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-2-4'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-2-5'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(
                            crud: controller.textController['chck_rslt_16-2']?.text == '해당없음' ? 'crud-r' : controller.crud.value,
                            borderType: "rb"
                        ),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['value_16-2-6'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.textController['chck_rslt_16-2']?.text == '해당없음' || controller.crud.value == 'crud-r' ? true : false
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                        height: 60,
                        width: 70
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
                            value: controller.textController['chck_rslt_16-2']!.text.isEmpty ? null : controller.textController['chck_rslt_16-2']?.text,
                            items: List.generate(controller.checkResultList.length, (index) {
                              return DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: controller.checkResultList[index],
                                  child: Ui.inspectionTitleText(controller.checkResultList[index])
                              );
                            }),
                            onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                              controller.textController['chck_rslt_16-2']?.text = value.toString();
                              // '해당없음' 선택 시, 점검전/후 비활성화
                              if (value == '해당없음') {
                                controller.textController.forEach((key, value) {
                                  if (key.contains('value_16-2-1')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-2-2')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-2-3')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-2-4')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-2-5')) {
                                    controller.textController[key]?.text = '';
                                  }
                                  if (key.contains('value_16-2-6')) {
                                    controller.textController[key]?.text = '';
                                  }
                                });
                              }
                              controller.update();     // GetBuilder 사용으로 인한 update 처리
                            }
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_16-2'],
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