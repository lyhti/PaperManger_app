import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable07ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable07ViewWidget({Key? key}) : super(key: key);

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
                        width: 150,
                        child: Ui.inspectionTitleText('No')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('점  검  내  용')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        child: Ui.inspectionTitleText('점 검 결 과')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 200,
                        child: Ui.inspectionTitleText('비  고')
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
                        height: 140,
                        width: 150,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 140,
                        width: 510,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('CB, DS, ES, 43RC 조작시험 (Indicator 동작 확인)'),
                            Ui.inspectionTitleText('- Local / Remote / SCADA 수동 조작'),
                            Ui.inspectionTitleText('- 보조계전기 동작상태 (DC24V, 125V)'),
                            Ui.inspectionTitleText('- Inter-Lock, PTX용'),
                            Ui.inspectionTitleText('- 조작회로 Diode')
                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 140,
                        width: 150,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_7-1']!.text.isEmpty ? null : controller.textController['chck_rslt_7-1']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-1']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                      height: 140,
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-1'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
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
                        width: 150,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('CB, DS, ES, Spring Charger Indicator 동작 상태')
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
                              value: controller.textController['chck_rslt_7-2']!.text.isEmpty ? null : controller.textController['chck_rslt_7-2']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-2']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-2'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('3')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('Spring Charger 동작 상태')
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
                              value: controller.textController['chck_rslt_7-3']!.text.isEmpty ? null : controller.textController['chck_rslt_7-3']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-3']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-3'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('4')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('Trip Free 시험')
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
                              value: controller.textController['chck_rslt_7-4']!.text.isEmpty ? null : controller.textController['chck_rslt_7-4']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-4']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-4'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('5')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('CB Counter 동작상태')
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
                              value: controller.textController['chck_rslt_7-5']!.text.isEmpty ? null : controller.textController['chck_rslt_7-5']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-5']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-5'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('6')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('CB Gas 누기(쇄정)시 동작 여부')
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
                              value: controller.textController['chck_rslt_7-6']!.text.isEmpty ? null : controller.textController['chck_rslt_7-6']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-6']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-6'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('7')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('온 ∙ 습도계 ∙ 히터 동작 상태')
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
                              value: controller.textController['chck_rslt_7-7']!.text.isEmpty ? null : controller.textController['chck_rslt_7-7']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-7']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-7'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('8')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('43RC ON 상태에서 CB 투입 → 43RC OFF 및 1분 후 재투입 시험'),
                            Ui.inspectionTitleText('- 79Ry 사용시')
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
                              value: controller.textController['chck_rslt_7-8']!.text.isEmpty ? null : controller.textController['chck_rslt_7-8']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-8']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-8'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('9')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('각종 보조계전기의 동작상태 점검')
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
                              value: controller.textController['chck_rslt_7-9']!.text.isEmpty ? null : controller.textController['chck_rslt_7-9']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-9']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-9'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('10')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('보호계전기에 의한 CB 연동시험'),
                            Ui.inspectionTitleText('- 79Ry가 있을 경우 재폐로 동작 확인, 순서 Blocking')
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
                              value: controller.textController['chck_rslt_7-10']!.text.isEmpty ? null : controller.textController['chck_rslt_7-10']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-10']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-10'],
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
                        width: 150,
                        child: Ui.inspectionTitleText('11')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 510,
                        child: Ui.inspectionTitleText('보호계전기 성능시험 (50, 79)')
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
                              value: controller.textController['chck_rslt_7-11']!.text.isEmpty ? null : controller.textController['chck_rslt_7-11']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-11']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-11'],
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
                        height: 80,
                        width: 150,
                        child: Ui.inspectionTitleText('12')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: 510,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('경보회로 시험'),
                            Ui.inspectionTitleText('- 50, 51, 50N, 51N, 79, Gas Low, 27D, 27A'),
                            Ui.inspectionTitleText('PT NFB')
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
                              value: controller.textController['chck_rslt_7-12']!.text.isEmpty ? null : controller.textController['chck_rslt_7-12']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_7-12']?.text = value.toString();
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
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_7-12'],
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