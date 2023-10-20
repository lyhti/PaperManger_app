import 'dart:io';
import '../../../../../common/ui.dart';
import '../../../../../common/util.dart';
import '../../../../../services/global_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/log.dart';
import '../../../../common/main_app_bar_widget.dart';
import '../../../../common/menu_button_widget.dart';
import '../../../empty_view.dart';
import '../../controller/work_sft_mtg_risk_asmt_edu_jrnl_1_controller.dart';
import '../work_sft_mtg_risk_asmt_edu_jrnl_1_bottom_widget.dart';

class WorkSafetyMeetingRiskAssessmentEducationJournal1V1 extends GetView<WorkSafetyMeetingRiskAssessmentEducationJournal1Controller> {
  final global = Get.find<GlobalService>();

  WorkSafetyMeetingRiskAssessmentEducationJournal1V1({Key? key}) : super(key: key);

  final smallRowHeight = 30.0;
  final rowHeight = 40.0;
  final dataVersion = 1;
  final operatorNum = 6;

  final numberColWidth = 100.0;
  final nameColWidth = 100.0;
  final timeColWidth = 150.0;
  final locationColWidth = 150.0;
  final photoColWidth = 150.0;

  @override
  Widget build(BuildContext context) {
    if(controller.dataVersion.value == dataVersion) {
      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '작업전후 안전회의 및 위험성평가 후 교육일지'),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: WorkSafetyMeetingRiskAssessmentEducationJournal1BottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
          body: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4,
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text('Version : 1'),

                          Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(),
                              ),
                              alignment: Alignment.center,
                              height: rowHeight,
                              width: 800,
                              child: Ui.inspectionTitleText('작업전[후] 안전회의 및 근로자 참여 위험성평가 후 교육일지', fontWeight: FontWeight.bold)
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Text('공사명', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 300,
                                child: TextField(
                                  controller: controller.textController['cstrn_nm'],
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  readOnly: controller.readOnlyYn.value
                                ),
                              ),

                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('시공회사명', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 250,
                                  child: TextField(
                                    controller: controller.textController['cstrn_entrps'],
                                    style: const TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
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
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Text('일시', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 300,
                                child: MaterialButton(
                                  elevation: 0,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () async {
                                    if (controller.readOnlyYn.isFalse) {
                                      await Ui.datePicker(context, controller.chckYmd);
                                    }
                                  },
                                  child: Obx(() => Text(controller.chckYmd.value.toString().substring(0, 10), style: const TextStyle(fontSize: 14))),
                                ),
                              ),

                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('작업책임자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 150,
                                child: TextField(
                                  controller: controller.textController['chck_nm'],
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                    border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  readOnly: controller.readOnlyYn.value
                                ),
                              ),

                              InkWell(
                                onTap: () async {
                                  if (controller.readOnlyYn.isFalse) {
                                    var sign = await Get.toNamed('/signature_page',
                                        arguments: {
                                          'doc_type' : controller.docType.value,
                                          'title' : '작업책임자'
                                        }
                                    );
                                    if (sign != null) {
                                      controller.imageUrl['chck_sign_file_name'] = sign;
                                    }
                                  }
                                },
                                child: Obx(() => Container(
                                    constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    child: controller.imageUrl["chck_sign_file_name"] == null
                                        ?
                                    const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                        :
                                    (controller.imageUrl["chck_sign_file_name"].runtimeType.toString() == "_File"
                                        ?
                                    Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
                                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                          return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                        }
                                    )
                                        :
                                    Image.network((global.global.value.apiFilePath! + controller.imageUrl["chck_sign_file_name"]),
                                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                            color: Ui.commonColors(),
                                          ),
                                        );
                                      },
                                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                      },
                                    ))
                                ),),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Text('작업인원', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 300,
                                child: TextField(
                                  controller: controller.textController['work_num'],
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                    border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  readOnly: controller.readOnlyYn.value
                                ),
                              ),

                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('작업장소', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 250,
                                  child: TextField(
                                      controller: controller.textController['lctn'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
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
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight * 8,
                                  width: 100,
                                  child: const Text('업무분담', style: TextStyle(fontSize: 14)),
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(width: 1.0, color: Colors.black),
                                          bottom: BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 100,
                                      child: const Text('작업자', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['work_asng_oper_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['work_asng_oper_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['work_asng_oper_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['work_asng_oper_4'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['work_asng_oper_5'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['work_asng_oper_6'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(width: 1.0, color: Colors.black),
                                        bottom: BorderSide(width: 1.0, color: Colors.black),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: rowHeight * 2,
                                    width: 250,
                                    child: const Text('작업내용', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 250,
                                    child: TextField(
                                      controller: controller.textController['work_asng_desc_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 250,
                                    child: TextField(
                                      controller: controller.textController['work_asng_desc_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          // contentPadding: const EdgeInsets.all(5.0),
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 250,
                                    child: TextField(
                                      controller: controller.textController['work_asng_desc_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 250,
                                    child: TextField(
                                      controller: controller.textController['work_asng_desc_4'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 250,
                                    child: TextField(
                                      controller: controller.textController['work_asng_desc_5'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 250,
                                    child: TextField(
                                      controller: controller.textController['work_asng_desc_6'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(width: 1.0, color: Colors.black),
                                          bottom: BorderSide(width: 1.0, color: Colors.black),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight,
                                      width: 350,
                                      child: const Text('작업 후 신체 이상여부 확인', style: TextStyle(fontSize: 14))
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.black),
                                            bottom: BorderSide(width: 1.0, color: Colors.black),
                                          ),
                                        ),
                                          alignment: Alignment.center,
                                          height: rowHeight,
                                          width: 100,
                                          child: const Text('이상유무', style: TextStyle(fontSize: 14))
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.black),
                                            bottom: BorderSide(width: 1.0, color: Colors.black),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: const Text('내용', style: TextStyle(fontSize: 14))
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.black),
                                            bottom: BorderSide(width: 1.0, color: Colors.black),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(fontSize: 14))
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [


                                      Obx(() => Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          alignment: AlignmentDirectional.center,
                                          // getx 오류로 인한 초기 null 처리.
                                          value: controller.textController['work_asng_anorm_yn_1']!.text.isEmpty ? '' : controller.textController['work_asng_anorm_yn_1']?.text,
                                          items: List.generate(controller.existList.length, (index) {
                                            return DropdownMenuItem(
                                              alignment: AlignmentDirectional.center,
                                              value: controller.existList[index],
                                              child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                            );
                                          }),
                                          onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                            controller.textController['work_asng_anorm_yn_1']?.text = value.toString();
                                            logger.d(controller.textController['work_asng_anorm_yn_1']?.text);                                            
                                            controller.update();
                                          }
                                        ),
                                      ),),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['work_asng_anorm_desc_1'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자1'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['work_asng_sign_file_name_1'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["work_asng_sign_file_name_1"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["work_asng_sign_file_name_1"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["work_asng_sign_file_name_1"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["work_asng_sign_file_name_1"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Obx(() => Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          alignment: AlignmentDirectional.center,
                                          // getx 오류로 인한 초기 null 처리.
                                          value: controller.textController['work_asng_anorm_yn_2']!.text.isEmpty ? '' : controller.textController['work_asng_anorm_yn_2']?.text,
                                          items: List.generate(controller.existList.length, (index) {
                                            return DropdownMenuItem(
                                              alignment: AlignmentDirectional.center,
                                              value: controller.existList[index],
                                              child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                            );
                                          }),
                                          onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                            controller.textController['work_asng_anorm_yn_2']?.text = value.toString();
                                            controller.update();
                                          }
                                        ),
                                      ),),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['work_asng_anorm_desc_2'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자2'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['work_asng_sign_file_name_2'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["work_asng_sign_file_name_2"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["work_asng_sign_file_name_2"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["work_asng_sign_file_name_2"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["work_asng_sign_file_name_2"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Obx(() => Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          alignment: AlignmentDirectional.center,
                                          // getx 오류로 인한 초기 null 처리.
                                          value: controller.textController['work_asng_anorm_yn_3']!.text.isEmpty ? '' : controller.textController['work_asng_anorm_yn_3']?.text,
                                          items: List.generate(controller.existList.length, (index) {
                                            return DropdownMenuItem(
                                              alignment: AlignmentDirectional.center,
                                              value: controller.existList[index],
                                              child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                            );
                                          }),
                                          onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                            controller.textController['work_asng_anorm_yn_3']?.text = value.toString();
                                            controller.update();
                                          }
                                        ),
                                      ),),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['work_asng_anorm_desc_3'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자3'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['work_asng_sign_file_name_3'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["work_asng_sign_file_name_3"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["work_asng_sign_file_name_3"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["work_asng_sign_file_name_3"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["work_asng_sign_file_name_3"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Obx(() => Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          alignment: AlignmentDirectional.center,
                                          // getx 오류로 인한 초기 null 처리.
                                          value: controller.textController['work_asng_anorm_yn_4']!.text.isEmpty ? '' : controller.textController['work_asng_anorm_yn_4']?.text,
                                          items: List.generate(controller.existList.length, (index) {
                                            return DropdownMenuItem(
                                              alignment: AlignmentDirectional.center,
                                              value: controller.existList[index],
                                              child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                            );
                                          }),
                                          onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                            controller.textController['work_asng_anorm_yn_4']?.text = value.toString();
                                            controller.update();                                            
                                          }
                                        ),
                                      ),),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['work_asng_anorm_desc_4'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자4'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['work_asng_sign_file_name_4'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["work_asng_sign_file_name_4"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["work_asng_sign_file_name_4"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["work_asng_sign_file_name_4"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["work_asng_sign_file_name_4"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Obx(() => Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          alignment: AlignmentDirectional.center,
                                          // getx 오류로 인한 초기 null 처리.
                                          value: controller.textController['work_asng_anorm_yn_5']!.text.isEmpty ? '' : controller.textController['work_asng_anorm_yn_5']?.text,
                                          items: List.generate(controller.existList.length, (index) {
                                            return DropdownMenuItem(
                                              alignment: AlignmentDirectional.center,
                                              value: controller.existList[index],
                                              child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                            );
                                          }),
                                          onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                            controller.textController['work_asng_anorm_yn_5']?.text = value.toString();
                                            controller.update();                                            
                                          }
                                        ),
                                      ),),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['work_asng_anorm_desc_5'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              // contentPadding: const EdgeInsets.all(5.0),
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자5'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['work_asng_sign_file_name_5'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["work_asng_sign_file_name_5"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["work_asng_sign_file_name_5"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["work_asng_sign_file_name_5"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["work_asng_sign_file_name_5"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Obx(() => Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: DropdownButton(
                                          isExpanded: true,
                                          alignment: AlignmentDirectional.center,
                                          // getx 오류로 인한 초기 null 처리.
                                          value: controller.textController['work_asng_anorm_yn_6']!.text.isEmpty ? '' : controller.textController['work_asng_anorm_yn_6']?.text,
                                          items: List.generate(controller.existList.length, (index) {
                                            return DropdownMenuItem(
                                              alignment: AlignmentDirectional.center,
                                              value: controller.existList[index],
                                              child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                            );
                                          }),
                                          onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                            controller.textController['work_asng_anorm_yn_6']?.text = value.toString();
                                            controller.update();                                            
                                          }
                                        ),
                                      ),),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['work_asng_anorm_desc_6'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자6'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['work_asng_sign_file_name_6'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["work_asng_sign_file_name_6"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["work_asng_sign_file_name_6"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["work_asng_sign_file_name_6"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["work_asng_sign_file_name_6"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 400,
                                  child: const Text('작업자 PMIS Check', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 400,
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 149,
                                        child: const Text('작업책임자 : '),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 150,
                                        child: TextField(
                                          controller: controller.textController['chck_nm'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(top: -8.0),
                                          ),
                                          enabled: false,
                                        ),
                                      ),
                                      Obx(() => Container(
                                          constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                          alignment: Alignment.center,
                                          child: controller.imageUrl["chck_sign_file_name"] == null
                                              ?
                                          const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                              :
                                          (controller.imageUrl["chck_sign_file_name"].runtimeType.toString() == "_File"
                                              ?
                                          Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                              }
                                          )

                                              :
                                          Image.network((global.global.value.apiFilePath! + controller.imageUrl["chck_sign_file_name"]),
                                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                  color: Ui.commonColors(),
                                                ),
                                              );
                                            },
                                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                              return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                            },
                                          ))
                                      ),),                                      
                                    ]
                                  ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('Physical', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 150,
                                child: const Text('․음주·약물복용/작업전', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['phsl_alch_bfr_work_exist_yn']!.text.isEmpty ? '' : controller.textController['phsl_alch_bfr_work_exist_yn']?.text,
                                    items: List.generate(controller.existList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.existList[index],
                                        child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['phsl_alch_bfr_work_exist_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),

                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: const Text('·중식후', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['phsl_alch_aftr_work_exist_yn']!.text.isEmpty ? '' : controller.textController['phsl_alch_aftr_work_exist_yn']?.text,
                                    items: List.generate(controller.existList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.existList[index],
                                        child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['phsl_alch_aftr_work_exist_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),

                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('Mental', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․분담작업 시행의지', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['mntl_will_good_yn']!.text.isEmpty ? '' : controller.textController['mntl_will_good_yn']?.text,
                                    items: List.generate(controller.goodList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.goodList[index],
                                        child: Text(controller.goodList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['mntl_will_good_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('(신체)', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․신체상태(혈색 등) 이상', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['phsl_anorm_exist_yn']!.text.isEmpty ? '' : controller.textController['phsl_anorm_exist_yn']?.text,
                                    items: List.generate(controller.existList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.existList[index],
                                        child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['phsl_anorm_exist_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('(정신)', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․가정사 등 Stress 여부', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['mntl_stress_exist_yn']!.text.isEmpty ? '' : controller.textController['mntl_stress_exist_yn']?.text,
                                    items: List.generate(controller.existList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.existList[index],
                                        child: Text(controller.existList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['mntl_stress_exist_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('Intelligent', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․분담작업 내용 숙지', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['inlg_asng_aware_good_yn']!.text.isEmpty ? '' : controller.textController['inlg_asng_aware_good_yn']?.text,
                                    items: List.generate(controller.goodList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.goodList[index],
                                        child: Text(controller.goodList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['inlg_asng_aware_good_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('Sensible', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․충분한 숙면여부', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['snsb_sleep_good_yn']!.text.isEmpty ? '' : controller.textController['snsb_sleep_good_yn']?.text,
                                    items: List.generate(controller.goodList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.goodList[index],
                                        child: Text(controller.goodList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['snsb_sleep_good_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('(지성)', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․안전작업수칙 숙지', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['inlg_sft_aware_good_yn']!.text.isEmpty ? '' : controller.textController['inlg_sft_aware_good_yn']?.text,
                                    items: List.generate(controller.goodList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.goodList[index],
                                        child: Text(controller.goodList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['inlg_sft_aware_good_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),

                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 100,
                                child: const Text('(감성)', style: TextStyle(fontSize: 14))
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 250,
                                child: const Text('․지시사항 반응정도', style: TextStyle(fontSize: 14))
                              ),
                              Obx(() => Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                alignment: Alignment.centerLeft,
                                height: rowHeight,
                                width: 50,
                                child: DropdownButton(
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.center,
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.textController['snsb_resp_good_yn']!.text.isEmpty ? '' : controller.textController['snsb_resp_good_yn']?.text,
                                    items: List.generate(controller.goodList.length, (index) {
                                      return DropdownMenuItem(
                                        alignment: AlignmentDirectional.center,
                                        value: controller.goodList[index],
                                        child: Text(controller.goodList[index], style: const TextStyle(fontSize: 14)),
                                      );
                                    }),
                                    onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                      controller.textController['snsb_resp_good_yn']?.text = value.toString();
                                      controller.update();                                            
                                    }
                                )
                              ),),
                            ],
                          ),

                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: rowHeight * 2.5,
                              width: 800,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('※ 작업 중 발생한 안전사고 등으로 인한 신체이상 발생 시 담당자 등에게 즉시 통보 할 것', style: TextStyle(fontSize: 14),),
                                    Text('※ 신체상태 판단 방법 : ① 음주, ② 혈압, ③ 산소포화도 측정 / 단, ②, ③항은 건강상태 참고 사항', style: TextStyle(fontSize: 14),),
                                    Text('     - ②, ③항의 건강에 이상이 있는 근로자는 일용직 근로자 관리카드 양식 활용 관리 시행', style: TextStyle(fontSize: 14),),
                                    Text('※ 작업자 PMIS Check (유) 또는 (불) 및 필수 안전조치사항 미이행 퇴거조치자 : , ,', style: TextStyle(fontSize: 14),),
                                  ],
                                ),
                              ),
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight * 14,
                                  width: 50,
                                  child: const Text('근\n로\n자\n참\n여\n\ \n위\n험\n성\n평\n가\n \n및\n \n교\n육', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 50,
                                      child: const Text('구분', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 3,
                                      width: 50,
                                      child: const Text('사람', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 3,
                                      width: 50,
                                      child: const Text('장비', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 3,
                                      width: 50,
                                      child: const Text('환경', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 3,
                                      width: 50,
                                      child: const Text('관리', style: TextStyle(fontSize: 14)),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 200,
                                      child: const Text('유해·위험요인', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['man_risk_fctr_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['man_risk_fctr_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['man_risk_fctr_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['eqp_risk_fctr_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['eqp_risk_fctr_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['eqp_risk_fctr_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['env_risk_fctr_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['env_risk_fctr_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['env_risk_fctr_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['mgt_risk_fctr_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['mgt_risk_fctr_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 200,
                                    child: TextField(
                                      controller: controller.textController['mgt_risk_fctr_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 100,
                                      child: const Text('위험성\n(현재)', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['man_crnt_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['man_crnt_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['man_crnt_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['eqp_crnt_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['eqp_crnt_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['eqp_crnt_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['env_crnt_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['env_crnt_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['env_crnt_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['mgt_crnt_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['mgt_crnt_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['mgt_crnt_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 150,
                                      child: const Text('위험감소 조치(방법)', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['man_risk_rdcn_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['man_risk_rdcn_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['man_risk_rdcn_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['eqp_risk_rdcn_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['eqp_risk_rdcn_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['eqp_risk_rdcn_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['env_risk_rdcn_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['env_risk_rdcn_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['env_risk_rdcn_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['mgt_risk_rdcn_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['mgt_risk_rdcn_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: TextField(
                                      controller: controller.textController['mgt_risk_rdcn_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 100,
                                      child: const Text('위험성\n(조치시)', style: TextStyle(fontSize: 14)),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['man_aft_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['man_aft_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['man_aft_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['eqp_aft_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['eqp_aft_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['eqp_aft_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['env_aft_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['env_aft_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['env_aft_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['mgt_aft_risk_1'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['mgt_aft_risk_2'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['mgt_aft_risk_3'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        border: Border(
                                          right: BorderSide(color: Colors.black, width: 1.0),
                                          bottom: BorderSide(color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      height: rowHeight * 2,
                                      width: 150,
                                      child: const Text('작업여부\n(가능/불가)', style: TextStyle(fontSize: 14)),
                                  ),
                                  Obx(() =>                                   Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['man_work_psb_1']!.text.isEmpty ? '' : controller.textController['man_work_psb_1']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['man_work_psb_1']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['man_work_psb_2']!.text.isEmpty ? '' : controller.textController['man_work_psb_2']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['man_work_psb_2']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['man_work_psb_3']!.text.isEmpty ? '' : controller.textController['man_work_psb_3']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['man_work_psb_3']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),


                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['eqp_work_psb_1']!.text.isEmpty ? '' : controller.textController['eqp_work_psb_1']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['eqp_work_psb_1']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['eqp_work_psb_2']!.text.isEmpty ? '' : controller.textController['eqp_work_psb_2']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['eqp_work_psb_2']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['eqp_work_psb_3']!.text.isEmpty ? '' : controller.textController['eqp_work_psb_3']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['eqp_work_psb_3']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['env_work_psb_1']!.text.isEmpty ? '' : controller.textController['env_work_psb_1']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['env_work_psb_1']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['env_work_psb_2']!.text.isEmpty ? '' : controller.textController['env_work_psb_2']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['env_work_psb_2']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['env_work_psb_3']!.text.isEmpty ? '' : controller.textController['env_work_psb_3']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['env_work_psb_3']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['mgt_work_psb_1']!.text.isEmpty ? '' : controller.textController['mgt_work_psb_1']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['mgt_work_psb_1']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['mgt_work_psb_2']!.text.isEmpty ? '' : controller.textController['mgt_work_psb_2']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['mgt_work_psb_2']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),

                                  Obx(() => Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 150,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      alignment: AlignmentDirectional.center,
                                      value: controller.textController['mgt_work_psb_3']!.text.isEmpty ? '' : controller.textController['mgt_work_psb_3']?.text,
                                      items: List.generate(controller.possibilityList.length, (index) {
                                        return DropdownMenuItem(
                                          alignment: AlignmentDirectional.center,
                                          value: controller.possibilityList[index],
                                          child: Text(controller.possibilityList[index], style: const TextStyle(fontSize: 14)),
                                        );
                                      }),
                                      onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                        controller.textController['mgt_work_psb_3']?.text = value.toString();
                                        controller.update();                                            
                                      }
                                    ), 
                                  ),),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 400,
                                  child: const Text('위험성평가 및 관리 기준', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 400,
                                  child: const Text('「위험성평가 후 교육」서명란 (T.B.M 1차) 작업 전', style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: rowHeight * 11,
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text('※ 계약시 제출한 위험성평가 결과를 토대로', style: TextStyle(color: Colors.blue, fontSize: 18)),
                                      Text('당일 작업의 공종에 대한 유해위험요인,', style: TextStyle(color: Colors.blue, fontSize: 18)),
                                      Text('현재 위험성, 감소조치 및 조치시 위험성을', style: TextStyle(color: Colors.blue, fontSize: 18)),
                                      Text('작성하시기 바랍니다.', style: TextStyle(color: Colors.blue, fontSize: 18)),
                                      Text('※ 업무분담 아래는 수기작성, 워드작업 불가', style: TextStyle(fontSize: 18)),
                                      Text('※ 작업자는 산업재해가 발생할 급박한 위험이', style: TextStyle(fontSize: 18)),
                                      Text('있는 경우 작업을 중지하고 대피할 수 있다.', style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('이름', style: TextStyle(fontSize: 14)),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(fontSize: 14)),
                                      ),

                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('이름', style: TextStyle(fontSize: 14)),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_1'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_1'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_1"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_1"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_1"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )

                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_1"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_2'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_2'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_2"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_2"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_2"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_2"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_3'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_3'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_3"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_3"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_3"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_3"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_4'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_4'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_4"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_4"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_4"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_4"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_5'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_5'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_5"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_5"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_5"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_5"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_6'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_6'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_6"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_6"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_6"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_6"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_7'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_7'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_7"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_7"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_7"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )

                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_7"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['pre_work_cnfm_nm_8'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['pre_work_cnfm_sign_file_name_8'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["pre_work_cnfm_sign_file_name_8"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["pre_work_cnfm_sign_file_name_8"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["pre_work_cnfm_sign_file_name_8"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["pre_work_cnfm_sign_file_name_8"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 400,
                                    child: const Text('「위험성평가 후 교육」서명란(T.B.M 2차) 중식 후', style: TextStyle(fontSize: 14)),
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('이름', style: TextStyle(fontSize: 14)),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(fontSize: 14)),
                                      ),

                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('이름', style: TextStyle(fontSize: 14)),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(fontSize: 14)),
                                      ),
                                    ],
                                  ), 


                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_1'],
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_1'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_1"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_1"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_1"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_1"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_2'],
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_2'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_2"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_2"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_2"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_2"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_3'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_3'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_3"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_3"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_3"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_3"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_4'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_4'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_4"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_4"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_4"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_4"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_5'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_5'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_5"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_5"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_5"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_5"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_6'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_6'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_6"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_6"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_6"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_6"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ), 

                                  Row(
                                    children: [
                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_7'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_7'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_7"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_7"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_7"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_7"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),

                                      Container(
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                        alignment: Alignment.center,
                                        height: rowHeight,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['aft_lnch_cnfm_nm_8'],
                                          style: const TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                        ),
                                      ),

                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '작업자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['aft_lnch_cnfm_sign_file_name_8'] = sign;
                                            }
                                          }
                                        },
                                        child: Obx(() => Container(
                                            constraints: const BoxConstraints.tightFor(height: 40, width: 100),
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                            alignment: Alignment.center,
                                            child: controller.imageUrl["aft_lnch_cnfm_sign_file_name_8"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
                                                :
                                            (controller.imageUrl["aft_lnch_cnfm_sign_file_name_8"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["aft_lnch_cnfm_sign_file_name_8"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["aft_lnch_cnfm_sign_file_name_8"]),
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                    color: Ui.commonColors(),
                                                  ),
                                                );
                                              },
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                              },
                                            ))
                                        ),),
                                      ),
                                    ],
                                  ),                                                                                                       

                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Container(
                                height: rowHeight,
                                width: numberColWidth,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                child: const Text('번호'),
                              ),
                              Container(
                                height: rowHeight,
                                width: nameColWidth,
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: "trb"),
                                child: const Text('이름'),
                              ),
                              Container(
                                height: rowHeight,
                                width: timeColWidth,
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: "trb"),
                                child: const Text('시간'),
                              ),
                              Container(
                                height: rowHeight,
                                width: locationColWidth,
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: "trb"),
                                child: const Text('위치'),
                              ),
                              Container(
                                height: rowHeight,
                                width: photoColWidth,
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(borderType: "trb"),
                                child: const Text('사진'),
                              ),
                            ],
                          ),

                          Column(
                            children: List.generate(operatorNum, (index) => 
                              Row(
                                children: [
                                  Container(
                                    height: 255,
                                    width: numberColWidth,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    child: Text((index + 1).toString()),
                                  ),
                                  Container(
                                    height: 255,
                                    width: nameColWidth,
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(borderType: "trb"),
                                    child: Obx(() => Text(controller.textController['work_asng_oper_${index + 1}']!.text)),
                                  ),
                                  Container(
                                    height: 255,
                                    width: timeColWidth,
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(borderType: "trb"),
                                    child: Obx(() => Text(controller.textController['work_asng_oper_photo_${index + 1}_time']!.text)),
                                  ),
                                  Container(
                                    height: 255,
                                    width: locationColWidth,
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(borderType: "trb"),
                                    child: Obx(() => Text(controller.textController['work_asng_oper_photo_${index + 1}_latitude']!.text + '\n' + controller.textController['work_asng_oper_photo_${index + 1}_longitude']!.text)),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: photoColWidth,
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(borderType: "trb"),
                                        child:
                                          controller.imageUrl["work_asng_oper_photo_file_name_${index + 1}"].runtimeType == XFile
                                              ?
                                          Image.file(File(controller.imageUrl["work_asng_oper_photo_file_name_${index + 1}"].path),
                                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                              return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 8));
                                            }
                                          )
                                              :
                                          Image.network((controller.imageUrl["work_asng_oper_photo_file_name_${index + 1}"] != null ? global.global.value.apiFilePath! + controller.imageUrl["work_asng_oper_photo_file_name_${index + 1}"] : ""),
                                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                  color: Ui.commonColors(),
                                                ),
                                              );
                                            },
                                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                              return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 8));
                                            },
                                          ),
                                      ),
                                      Container(
                                        height: 55,
                                        width: 150,
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(borderType: "rb"),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: controller.crud.value == 'crud-r' ? null : () async {
                                                  logger.d("work_asng_oper_photo_file_name_${index + 1}");
                                                  await controller.getCamera("work_asng_oper_photo_file_name_${index + 1}");
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(Icons.camera_alt_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Ui.commonColors()),
                                                    Text('카메라', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                                  ],
                                                )
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(left: 15),
                                              child: InkWell(
                                                  onTap: controller.crud.value == 'crud-r' ? null : () async {
                                                    if (controller.imageUrl["work_asng_oper_photo_file_name_${index + 1}"] != null) {
                                                      Util.confirm('이미지를 삭제 하시겠습니까?', callback: () async {
                                                        await controller.imageUrl.remove("work_asng_oper_photo_file_name_${index + 1}");
                                                        controller.imageUrl.refresh();
                                                        controller.update();
                                                      });
                                                    }
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Icon(Icons.dangerous_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.red),
                                                      Text('삭    제', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                                    ],
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // SizedBox(
                          //   height: rowHeight + 305 * operatorNum,
                          //   width: numberColWidth + nameColWidth + timeColWidth + locationColWidth + photoColWidth,
                          //   child: ListView.builder(
                          //     itemCount : operatorNum + 1,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       if(index == 0) {
                          //         return Row(
                          //           children: [
                          //             Container(
                          //               height: rowHeight,
                          //               width: numberColWidth,
                          //               alignment: Alignment.center,
                          //               decoration: BoxDecoration(
                          //                 border: Border.all(),
                          //               ),
                          //               child: const Text('번호'),
                          //             ),
                          //             Container(
                          //               height: rowHeight,
                          //               width: nameColWidth,
                          //               alignment: Alignment.center,
                          //               decoration: Ui.boxDecoration(borderType: "trb"),
                          //               child: const Text('이름'),
                          //             ),
                          //             Container(
                          //               height: rowHeight,
                          //               width: timeColWidth,
                          //               alignment: Alignment.center,
                          //               decoration: Ui.boxDecoration(borderType: "trb"),
                          //               child: const Text('시간'),
                          //             ),
                          //             Container(
                          //               height: rowHeight,
                          //               width: locationColWidth,
                          //               alignment: Alignment.center,
                          //               decoration: Ui.boxDecoration(borderType: "trb"),
                          //               child: const Text('위치'),
                          //             ),
                          //             Container(
                          //               height: rowHeight,
                          //               width: photoColWidth,
                          //               alignment: Alignment.center,
                          //               decoration: Ui.boxDecoration(borderType: "trb"),
                          //               child: const Text('사진'),
                          //             ),
                          //           ],
                          //         );
                          //       }

                          //       return Row(
                          //         children: [
                          //           Container(
                          //             height: 255,
                          //             width: numberColWidth,
                          //             alignment: Alignment.center,
                          //             decoration: BoxDecoration(
                          //               border: Border.all(),
                          //             ),
                          //             child: Text(index.toString()),
                          //           ),
                          //           Container(
                          //             height: 255,
                          //             width: nameColWidth,
                          //             alignment: Alignment.center,
                          //             decoration: Ui.boxDecoration(borderType: "trb"),
                          //             child: Obx(() => Text(controller.textController['work_asng_oper_$index']!.text)),
                          //           ),
                          //           Container(
                          //             height: 255,
                          //             width: timeColWidth,
                          //             alignment: Alignment.center,
                          //             decoration: Ui.boxDecoration(borderType: "trb"),
                          //             child: Obx(() => Text(controller.textController['work_asng_oper_photo_${index}_time']!.text)),
                          //           ),
                          //           Container(
                          //             height: 255,
                          //             width: locationColWidth,
                          //             alignment: Alignment.center,
                          //             decoration: Ui.boxDecoration(borderType: "trb"),
                          //             child: Obx(() => Text(controller.textController['work_asng_oper_photo_${index}_latitude']!.text + '\n' + controller.textController['work_asng_oper_photo_${index}_longitude']!.text)),
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 height: 200,
                          //                 width: photoColWidth,
                          //                 alignment: Alignment.center,
                          //                 decoration: Ui.boxDecoration(borderType: "trb"),
                          //                 child:
                          //                   controller.imageUrl["work_asng_oper_photo_file_name_$index"].runtimeType == XFile
                          //                       ?
                          //                   Image.file(File(controller.imageUrl["work_asng_oper_photo_file_name_$index"].path),
                          //                     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          //                       return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 8));
                          //                     }
                          //                   )
                          //                       :
                          //                   Image.network((controller.imageUrl["work_asng_oper_photo_file_name_$index"] != null ? global.global.value.apiFilePath! + controller.imageUrl["work_asng_oper_photo_file_name_$index"] : ""),
                          //                     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          //                       if (loadingProgress == null) {
                          //                         return child;
                          //                       }
                          //                       return Center(
                          //                         child: CircularProgressIndicator(
                          //                           value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                          //                           color: Ui.commonColors(),
                          //                         ),
                          //                       );
                          //                     },
                          //                     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          //                       return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 8));
                          //                     },
                          //                   ),
                          //               ),
                          //               Container(
                          //                 height: 55,
                          //                 width: 150,
                          //                 alignment: Alignment.center,
                          //                 decoration: Ui.boxDecoration(borderType: "rb"),
                          //                 child: Row(
                          //                   mainAxisAlignment: MainAxisAlignment.center,
                          //                   children: [
                          //                     InkWell(
                          //                         onTap: controller.crud.value == 'crud-r' ? null : () async {
                          //                           await controller.getCamera("work_asng_oper_photo_file_name_$index");
                          //                         },
                          //                         child: Column(
                          //                           children: [
                          //                             Icon(Icons.camera_alt_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Ui.commonColors()),
                          //                             Text('카메라', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                          //                           ],
                          //                         )
                          //                     ),
                          //                     Container(
                          //                       margin: const EdgeInsets.only(left: 15),
                          //                       child: InkWell(
                          //                           onTap: controller.crud.value == 'crud-r' ? null : () async {
                          //                             if (controller.imageUrl["work_asng_oper_photo_file_name_$index"] != null) {
                          //                               Util.confirm('이미지를 삭제 하시겠습니까?', callback: () async {
                          //                                 await controller.imageUrl.remove("work_asng_oper_photo_file_name_$index");
                          //                                 controller.imageUrl.refresh();
                          //                                 controller.update();
                          //                               });
                          //                             }
                          //                           },
                          //                           child: Column(
                          //                             children: [
                          //                               Icon(Icons.dangerous_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.red),
                          //                               Text('삭    제', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                          //                             ],
                          //                           )
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       );                                
                          //     }
                          //   )                            
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const EmptyViewWidget(title: "데이터 버전이 맞지 않습니다.");
    }
 }
}