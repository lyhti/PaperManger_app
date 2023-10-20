import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/circular_loading_widget.dart';
import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';
import '../../../services/global_service.dart';
import '../controller/hvy_mtrl_hndl_work_plan_controller.dart';
import 'hvy_mtrl_hndl_work_plan_bottom_widget.dart';

class HeavyMaterialHandlingWorkPlanViewWidget extends GetView<HeavyMaterialHandlingWorkPlanController> {
  HeavyMaterialHandlingWorkPlanViewWidget({Key ? key}) : super(key: key);

  final global = Get.find<GlobalService>();

  final smallRowHeight = 30.0;
  final rowHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HeavyMaterialHandlingWorkPlanController>(init: HeavyMaterialHandlingWorkPlanController(), builder: (controller) {
      if(controller.isInitialized.value == false) {
        return const CircularLoadingWidget(height: 70);
      }

      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '중량물 취급 작업계획서'),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: HeavyMaterialHandlingWorkPlanBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
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
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('1. 작업개요', style: TextStyle(fontSize: 18)),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('가. 일반현황', style: TextStyle(fontSize: 18)),
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('작업명', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "trb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['1_work_nm'],
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
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('관리부서\n및 책임자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "trb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['1_mgt_dpmt'],
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
                                  width: 150,
                                  child: const Text('작업일시\n(기간, 시간)', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['1_work_time'],
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
                                  controller: controller.textController['1_work_lctn'],
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
                                  width: 150,
                                  child: const Text('작업내용', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['1_work_desc'],
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
                                  child: const Text('신호방법', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['1_sgnl_mthd'],
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
                                  width: 150,
                                  child: const Text('제한속도', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['1_spd_lmt'],
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
                                  child: const Text('', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('나. 작업인원', style: TextStyle(fontSize: 18)),
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Text('직책', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 200,
                                  child: const Text('성명 및 연락처', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Text('작업위치', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Text('교육*', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('보호구 지급', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('필요자격', style: TextStyle(fontSize: 14)),
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
                                  child: const Text('작업지휘자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_work_spvs_nm'],
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
                                  controller: controller.textController['1_work_spvs_lctn'],
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
                                  controller: controller.textController['1_work_spvs_edu'],
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
                                  controller: controller.textController['1_work_spvs_prtcr'],
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
                                  controller: controller.textController['1_work_spvs_qlfc'],
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
                                  child: const Text('유도자(신호)', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_sgnl_idct_1_nm'],
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
                                  controller: controller.textController['1_sgnl_idct_1_lctn'],
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
                                  controller: controller.textController['1_sgnl_idct_1_edu'],
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
                                  controller: controller.textController['1_sgnl_idct_1_prtcr'],
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
                                  controller: controller.textController['1_sgnl_idct_1_qlfc'],
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
                                  child: const Text('유도자(신호)', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_sgnl_idct_2_nm'],
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
                                  controller: controller.textController['1_sgnl_idct_2_lctn'],
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
                                  controller: controller.textController['1_sgnl_idct_2_edu'],
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
                                  controller: controller.textController['1_sgnl_idct_2_prtcr'],
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
                                  controller: controller.textController['1_sgnl_idct_2_qlfc'],
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
                                  child: const Text('작업자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_wrkr_1_nm'],
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
                                  controller: controller.textController['1_wrkr_1_lctn'],
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
                                  controller: controller.textController['1_wrkr_1_edu'],
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
                                  controller: controller.textController['1_wrkr_1_prtcr'],
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
                                  controller: controller.textController['1_wrkr_1_qlfc'],
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
                                  child: const Text('작업자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_wrkr_2_nm'],
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
                                  controller: controller.textController['1_wrkr_2_lctn'],
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
                                  controller: controller.textController['1_wrkr_2_edu'],
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
                                  controller: controller.textController['1_wrkr_2_prtcr'],
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
                                  controller: controller.textController['1_wrkr_2_qlfc'],
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
                                  child: const Text('작업자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_wrkr_3_nm'],
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
                                  controller: controller.textController['1_wrkr_3_lctn'],
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
                                  controller: controller.textController['1_wrkr_3_edu'],
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
                                  controller: controller.textController['1_wrkr_3_prtcr'],
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
                                  controller: controller.textController['1_wrkr_3_qlfc'],
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
                                  child: const Text('조종(운전)자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                  controller: controller.textController['1_drvr_nm'],
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
                                  controller: controller.textController['1_drvr_lctn'],
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
                                  controller: controller.textController['1_drvr_edu'],
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
                                  controller: controller.textController['1_drvr_prtcr'],
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
                                  controller: controller.textController['1_drvr_qlfc'],
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
                                  child: const Text('교육내용*', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 700,
                                child: TextField(
                                  controller: controller.textController['1_edu_desc'],
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  readOnly: controller.readOnlyYn.value
                                ),
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('다. 작업순서', style: TextStyle(fontSize: 18)),
                          ),
                          Container(
                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "all"),
                            alignment: Alignment.center,
                            height: rowHeight,
                            width: 800,
                            child: TextField(
                              controller: controller.textController['1_work_seq'],
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                              ),
                              readOnly: controller.readOnlyYn.value
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('2. 중량물제원', style: TextStyle(fontSize: 18)),
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('품명', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "trb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['2_prod_nm'],
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
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('중량물 형상', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "trb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['2_hvy_mtrl_shp'],
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
                                  width: 150,
                                  child: const Text('중량물 규격', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 650,
                                child: TextField(
                                  controller: controller.textController['2_hvy_mtrl_stnd'],
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
                                  width: 150,
                                  child: const Text('중량', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['2_wght'],
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
                                  child: const Text('1회 운반중량', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['2_move_wght'],
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
                                  width: 150,
                                  child: const Text('고정방법', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 650,
                                child: TextField(
                                  controller: controller.textController['2_fix_mthd'],
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  readOnly: controller.readOnlyYn.value
                                ),
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('※ 중량물 단위별 작성', style: TextStyle(fontSize: 18, color: Colors.blue, fontStyle: FontStyle.italic)),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('3. 기계제원', style: TextStyle(fontSize: 18)),
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('기계명(장비)', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "trb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_eqp_nm'],
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
                                      top: BorderSide(color: Colors.black, width: 1.0),
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('기계번호', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "trb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_eqp_sn'],
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
                                  width: 150,
                                  child: const Text('모델명', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_mdl_nm'],
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
                                  child: const Text('기계규격', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_eqp_stnd'],
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
                                  width: 150,
                                  child: const Text('작업능력', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_work_cpct'],
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
                                  child: const Text('작업가능 반경', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_work_rds'],
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
                                  width: 150,
                                  child: const Text('조종(운전)자', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_drvr'],
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
                                  child: const Text('조종(운전)자격', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_drvr_qlfc'],
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
                                  width: 150,
                                  child: const Text('보험기간', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_isrn_perd'],
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
                                  child: const Text('검사여부', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_insp_yn'],
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
                                  width: 150,
                                  child: const Text('줄걸이 방법', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_wrng_mthd'],
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
                                  child: const Text('운반거리', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 250,
                                child: TextField(
                                  controller: controller.textController['3_move_dist'],
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
                                  width: 150,
                                  child: const Text('줄걸이 용구(달기구)', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 650,
                                child: TextField(
                                  controller: controller.textController['3_wrng_tool'],
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                  ),
                                  readOnly: controller.readOnlyYn.value
                                ),
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('※ 사용 기계별 작성', style: TextStyle(fontSize: 18, color: Colors.blue, fontStyle: FontStyle.italic)),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('4. 재해예방대책', style: TextStyle(fontSize: 18)),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('※ 위험요인별 혹은 작업(순서)별로 서술하는 등 현장 상황에 맞게 작성[아래 예시는 작업별 서술]', style: TextStyle(fontSize: 18, color: Colors.blue, fontStyle: FontStyle.italic)),
                          ),

                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 150,
                                  child: const Text('작업구분', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(width: 1.0, color: Colors.black),
                                      right: BorderSide(width: 1.0, color: Colors.black),
                                      bottom: BorderSide(width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 300,
                                  child: const Text('유해·위험요인', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    border: Border(
                                      top: BorderSide(width: 1.0, color: Colors.black),
                                      right: BorderSide(width: 1.0, color: Colors.black),
                                      bottom: BorderSide(width: 1.0, color: Colors.black),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 350,
                                  child: const Text('재해예방대책', style: TextStyle(fontSize: 14)),
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
                                  width: 150,
                                  child: const Text('작업 전 확인사항', style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                alignment: Alignment.center,
                                height: rowHeight,
                                width: 650,
                                child: TextField(
                                  controller: controller.textController['4_pre_work_chck_list'],
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
                                  height: rowHeight * 3,
                                  width: 150,
                                  child: const Text('운반(인양) 작업', style: TextStyle(fontSize: 14)),
                              ),

                              Column(
                                children: [
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 300,
                                    child: TextField(
                                      controller: controller.textController['4_move_work_1_fctr'],
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
                                    width: 300,
                                    child: TextField(
                                      controller: controller.textController['4_move_work_2_fctr'],
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
                                    width: 300,
                                    child: TextField(
                                      controller: controller.textController['4_move_work_3_fctr'],
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
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 350,
                                    child: TextField(
                                      controller: controller.textController['4_move_work_1_msrs'],
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
                                    width: 350,
                                    child: TextField(
                                      controller: controller.textController['4_move_work_2_msrs'],
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
                                    width: 350,
                                    child: TextField(
                                      controller: controller.textController['4_move_work_3_msrs'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
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
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      left: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight * 3,
                                  width: 150,
                                  child: const Text('인양물 안착작업', style: TextStyle(fontSize: 14)),
                              ),

                              Column(
                                children: [
                                  Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 300,
                                    child: TextField(
                                      controller: controller.textController['4_slvg_work_1_fcrt'],
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
                                    width: 300,
                                    child: TextField(
                                      controller: controller.textController['4_slvg_work_2_fcrt'],
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
                                    width: 300,
                                    child: TextField(
                                      controller: controller.textController['4_slvg_work_3_fcrt'],
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
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                    alignment: Alignment.center,
                                    height: rowHeight,
                                    width: 350,
                                    child: TextField(
                                      controller: controller.textController['4_slvg_work_1_msrs'],
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
                                    width: 350,
                                    child: TextField(
                                      controller: controller.textController['4_slvg_work_2_msrs'],
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
                                    width: 350,
                                    child: TextField(
                                      controller: controller.textController['4_slvg_work_3_msrs'],
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('5. 운반경로(작업도면) 등', style: TextStyle(fontSize: 18)),
                          ),

                          Container(
                            decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "all"),
                            alignment: Alignment.center,
                            height: rowHeight,
                            width: 800,
                            child: TextField(
                              controller: controller.textController['5_move_path'],
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                              ),
                              readOnly: controller.readOnlyYn.value
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('6. 기타 붙임자료 등', style: TextStyle(fontSize: 18)),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            height: rowHeight,
                            width: 800,
                            child: const Text('※ 교육일지, 기계보험, 기계사양서(인양하중표), 작업 전 체크리스트, 안전수칙 등', style: TextStyle(fontSize: 18, color: Colors.blue, fontStyle: FontStyle.italic)),
                          ),

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
    });
  }

  Future<void> selectedTime24Hour(BuildContext context, hourParam, minuteParam) async {
    var result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: hourParam, minute: minuteParam),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if(result != null) {
      // controller.chckDate.value = '${result.hour.toString().padLeft(2, '0')}:${result.minute.toString().padLeft(2, '0')}';
   } 
  } 
}