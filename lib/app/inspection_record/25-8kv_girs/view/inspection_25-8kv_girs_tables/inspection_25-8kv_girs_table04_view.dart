import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable04ViewWidget extends GetView<Inspection258kvGirsController> {

  const Inspection258kvGirsTable04ViewWidget({Key? key}) : super(key: key);

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
                        height: 210,
                        width: 100,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 210,
                        width: 400,
                        child: Column(
                          children: [
                            Ui.inspectionTitleText('개폐기(CB, DS) OFF 상태 확인'),
                            Image.asset('assets/figure-4-1.jpg'),
                          ],
                        ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 210,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-1']!.text.isEmpty ? null : controller.textController['chck_rslt_4-1']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: controller.checkResultList[index],
                                  child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-1']?.text = value.toString();
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
                        width: 200,
                        child: TextField(
                            controller: controller.textController['rmrk_4-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            minLines: 1,
                            maxLines: 8,
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
                        child: Ui.inspectionTitleText('발청 및 변형 유무')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-2']!.text.isEmpty ? null : controller.textController['chck_rslt_4-2']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-2']?.text = value.toString();
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
                            controller: controller.textController['rmrk_4-2'],
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
                        child: Ui.inspectionTitleText('Gas 누기 여부')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-3']!.text.isEmpty ? null : controller.textController['chck_rslt_4-3']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-3']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-3'],
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
                        child: Ui.inspectionTitleText('4')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('Gas Valve 작동 및 외관 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-4']!.text.isEmpty ? null : controller.textController['chck_rslt_4-4']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-4']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-4'],
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
                        height: 420,
                        width: 100,
                        child: Ui.inspectionTitleText('5')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 420,
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ui.inspectionTitleText('Gas gauge 이상 유무'),
                            Ui.inspectionTitleText('[Gas gauge 고장 예방]'),
                            Ui.inspectionTitleText('○ SF6 Gas 주입시 게이지 충격 방지를 위해 서서히 주입'),
                            Ui.inspectionTitleText('☞ 레귤레이터 사용'),
                            Ui.inspectionTitleText('○ Gauge 부동작시 손가락으로 약하게 충격을 주어 게이지 움직임 관찰'),
                            Image.asset('assets/figure-4-5.jpg')
                          ],
                        ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 420,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-5']!.text.isEmpty ? null : controller.textController['chck_rslt_4-5']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-5']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                      height: 420,
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_4-5'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          minLines: 1,
                          maxLines: 18,
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
                        height: 300,
                        width: 100,
                        child: Ui.inspectionTitleText('6')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 300,
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ui.inspectionTitleText('가스 주입구 스프링 Return 상태 \n  Ο 미복귀시 Gas 누기'),
                            Image.asset('assets/figure-4-6.jpg'),
                          ],
                        ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 300,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-6']!.text.isEmpty ? null : controller.textController['chck_rslt_4-6']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-6']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      alignment: Alignment.center,
                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                      height: 300,
                      width: 200,
                      child: TextField(
                          controller: controller.textController['rmrk_4-6'],
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rlb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: Ui.inspectionTitleText('7'),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('각 부분 청소 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-7']!.text.isEmpty ? null : controller.textController['chck_rslt_4-7']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-7']?.text = value.toString();
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
                            controller: controller.textController['rmrk_4-7'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('8')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('각종 명판 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-8']!.text.isEmpty ? null : controller.textController['chck_rslt_4-8']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-8']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-8'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('9')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('Gas Pipe 외관 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-9']!.text.isEmpty ? null : controller.textController['chck_rslt_4-9']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-9']?.text = value.toString();
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
                        controller: controller.textController['rmrk_4-9'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5.0),
                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                        ),
                        readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('10')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('각종 Packing 접착 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-10']!.text.isEmpty ? null : controller.textController['chck_rslt_4-10']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-10']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-10'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        height: 70,
                        width: 100,
                        child: Ui.inspectionTitleText('11')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 70,
                        width: 400,
                        child: Ui.inspectionTitleText('각종 Bolt/Nut 의 조임 상태 \n  - 체크마크 확인 및 체크마크 표기')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 70,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-11']!.text.isEmpty ? null : controller.textController['chck_rslt_4-11']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-11']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 70,
                        width: 200,
                        child: TextField(
                          controller: controller.textController['rmrk_4-11'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('12')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('각종 접지 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-12']!.text.isEmpty ? null : controller.textController['chck_rslt_4-12']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-12']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-12'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('13')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('표시램프 점등 상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-13']!.text.isEmpty ? null : controller.textController['chck_rslt_4-13']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-13']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-13'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        height: 70,
                        width: 100,
                        child: Ui.inspectionTitleText('14')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 70,
                        width: 400,
                        child: Ui.inspectionTitleText('LCP 및 조작함 Door 여닫힘 상태\n  - Door의 제어케이블 간섭 여부 확인')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 70,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-14']!.text.isEmpty ? null : controller.textController['chck_rslt_4-14']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-14']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 70,
                        width: 200,
                        child: TextField(
                          controller: controller.textController['rmrk_4-14'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        height: 90,
                        width: 100,
                        child: Ui.inspectionTitleText('15')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 90,
                        width: 400,
                        child: Ui.inspectionTitleText('제어용전산, CT 2차 배선\n  - Door장력, 외피손상 여부\n  - Heater에 의한 표피 열손상 여부')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 90,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-15']!.text.isEmpty ? null : controller.textController['chck_rslt_4-15']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-15']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 90,
                        width: 200,
                        child: TextField(
                          controller: controller.textController['rmrk_4-15'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          minLines: 1,
                          maxLines: 3,
                          readOnly: controller.readOnlyYn.value,
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
                        height: 70,
                        width: 100,
                        child: Ui.inspectionTitleText('16')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 70,
                        width: 400,
                        child: Ui.inspectionTitleText('각종 단자대 점검\n  - 단자탈락, 표피 변형, 과다장력, 단자조임등')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 70,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-16']!.text.isEmpty ? null : controller.textController['chck_rslt_4-16']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-16']?.text = value.toString();
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          ),
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 70,
                        width: 200,
                        child: TextField(
                          controller: controller.textController['rmrk_4-16'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('17')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('CT 결선 (Ratio, 결선), 정정표 참조')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-17']!.text.isEmpty ? null : controller.textController['chck_rslt_4-17']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-17']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-17'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('18')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('인출케이블 과다장력 여부(지지 크리트 시공여부)')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-18']!.text.isEmpty ? null : controller.textController['chck_rslt_4-18']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-18']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-18'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('19')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('케이블 접속부 점검(볼트 풀림 여부등)')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-19']!.text.isEmpty ? null : controller.textController['chck_rslt_4-19']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-19']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-19'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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
                        child: Ui.inspectionTitleText('20')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 400,
                        child: Ui.inspectionTitleText('GIS 내부, 외부 발청상태')
                    ),
                    Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 200,
                        child: SizedBox(
                          width: 150,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('양호'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.textController['chck_rslt_4-20']!.text.isEmpty ? null : controller.textController['chck_rslt_4-20']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_4-20']?.text = value.toString();
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
                          controller: controller.textController['rmrk_4-20'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(5.0),
                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                          ),
                          readOnly: controller.readOnlyYn.value,
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