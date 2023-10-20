import 'dart:io';

import 'package:Paper_Manager/app/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc/view/work_safety_check_list_s17_steel_structure_assembly_busbar_wiring_construction_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/circular_loading_widget.dart';
import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';
import '../../../services/global_service.dart';
import '../controller/work_safety_check_list_s17_steel_structure_assembly_busbar_wiring_construction_controller.dart';

class WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionViewWidget  extends GetView<WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionController> {
  WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionViewWidget({Key ? key}) : super(key: key);

  final global = Get.find<GlobalService>();

  final smallRowHeight = 30.0;
  final rowHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionController>(init: WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionController(), builder: (controller) {
      if(controller.isInitialized.value == false) {
        return const CircularLoadingWidget(height: 70);
      } 

      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '작업안전 체크리스트(S17 철구 조립 및 모선배선공사)'),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
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
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              alignment: Alignment.center,
                              height: rowHeight,
                              width: 800,
                              child: Ui.inspectionTitleText('작업안전 체크리스트', fontWeight: FontWeight.bold)
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
                                  width: 200,
                                  child: Ui.inspectionTitleText('작업공종(Code)', fontWeight: FontWeight.bold)
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 200,
                                  child: Ui.inspectionTitleText('S17', fontWeight: FontWeight.bold)
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
                                  child: Ui.inspectionTitleText('철구 조립 및 모선배선공사', fontWeight: FontWeight.bold)
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
                                  width: 200,
                                  child: Ui.inspectionTitleText('시공사', fontWeight: FontWeight.bold)
                              ),

                              Obx(() => Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.centerLeft,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                height: rowHeight,
                                width: 200,
                                child: TextField(
                                    controller: controller.textController['cstrn_entrps'],
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        // contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.readOnlyYn.value
                                ),
                              ),),
                              // Container(
                              //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              //   alignment: Alignment.centerLeft,
                              //   decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "rb"),
                              //   height: rowHeight,
                              //   width: 200,
                              //   child: TextField(
                              //       controller: controller.textController['cstrn_entrps'],
                              //       style: const TextStyle(fontSize: 18),
                              //       decoration: InputDecoration(
                              //           contentPadding: const EdgeInsets.all(5.0),
                              //           border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                              //       ),
                              //       readOnly: controller.readOnlyYn.value
                              //   ),
                              // ),


                              // Container(
                              //     decoration: const BoxDecoration(
                              //       border: Border(
                              //         right: BorderSide(color: Colors.black, width: 1.0),
                              //         bottom: BorderSide(color: Colors.black, width: 1.0),
                              //       ),
                              //     ),
                              //     alignment: Alignment.center,
                              //     height: rowHeight,
                              //     width: 200,
                              //     child: Ui.inspectionTitleText('', fontWeight: FontWeight.bold)
                              // ),
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
                                  child: Ui.inspectionTitleText('공사명', fontWeight: FontWeight.bold)
                              ),

                              Obx(() => Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.centerLeft,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                height: rowHeight,
                                width: 300,
                                child: TextField(
                                    controller: controller.textController['cstrn_nm'],
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                       contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.readOnlyYn.value
                                ),
                              ),),

                              // Container(
                              //     decoration: const BoxDecoration(
                              //       border: Border(
                              //         right: BorderSide(color: Colors.black, width: 1.0),
                              //         bottom: BorderSide(color: Colors.black, width: 1.0),
                              //       ),
                              //     ),
                              //     alignment: Alignment.center,
                              //     height: rowHeight,
                              //     width: 300,
                              //     child: Ui.inspectionTitleText('', fontWeight: FontWeight.bold)
                              // ),
                            ],
                          ),

                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                left: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            height: smallRowHeight,
                            width: 800,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    const TextSpan(
                                      text: '※ 사진 전송방법 : ① 실적 등록대상[',
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        child: Image.asset(
                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                          height: 16,
                                        ),
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ']을 휴대폰으로 사진 촬영하여 공사번호+Code 번호 입력 후',
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                left: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            height: smallRowHeight,
                            width: 800,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: Text('#1230으로 전송(한글 및 특수기호 입력 시 미연계 될 수 있으니 숫자와 영문자만 입력)', style: TextStyle(fontSize: 16),),
                            ),
                          ),

                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                left: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            height: smallRowHeight,
                            width: 800,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 127),
                              child: RichText(
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    const TextSpan(
                                      text: '② 실적 등록 대상[',
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        child: Image.asset(
                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                          height: 16,
                                        ),
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ']을 안드로이드용 모바일 기기에 설치된 전용 App을 통하여',
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                left: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            height: smallRowHeight,
                            width: 800,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: Text('공사현장 모니터링 사진 전송(아이폰은 사용 불가)', style: TextStyle(fontSize: 16),)
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
                                  height: rowHeight,
                                  width: 400,
                                  child: Ui.inspectionTitleText('【 작업절차도 】', fontWeight: FontWeight.bold)
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
                                  child: Ui.inspectionTitleText('【 위험요인 】', fontWeight: FontWeight.bold)
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
                                  height: rowHeight * 29,
                                  width: 400,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image.asset(
                                      'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_fig1_1.jpg',
                                    ),
                                  ),
                              ),
                              Column(
                                children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            right: BorderSide(color: Colors.black, width: 1.0),
                                            bottom: BorderSide(color: Colors.black, width: 1.0),
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                        height: rowHeight * 3,
                                        width: 400,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text('○ 감전 → 활선부위 철구 승탑 및 활선 근접', style: TextStyle(fontSize: 16),),
                                            Text('○ 추락 → 철구 승탑 작업 및 이동 중 헛디딤', style: TextStyle(fontSize: 16),),
                                            Text('○ 낙하 → 철구 승탑 후 모선 연결 작업시 자재, 공기구', style: TextStyle(fontSize: 16),),
                                            Text('○ 전도 → 크레인 붐 이동중, 중량물 과적, 아웃트리거 부적정', style: TextStyle(fontSize: 16),),
                                          ],
                                        ),
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
                                            width: 240,
                                            child: Ui.inspectionTitleText('【 핵심 Check Point 】', fontWeight: FontWeight.bold)
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: const Text('확인', style: TextStyle(fontSize: 16)),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: const Text('해당없음', style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text('2. 검전, 접지', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <InlineSpan>[
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                        child: Image.asset(
                                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                          height: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '휴전선로 현장접지 시행',
                                                      style: TextStyle(fontSize: 14, color: Colors.red)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_2.value == 'Y'  ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_2.value == 'Y') {
                                                    controller.coreCheckPoint_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),
                                            ),
                                            // Checkbox(
                                            //   checkColor: Colors.black,
                                            //   value: controller.coreCheckPoint_2.value == 'Y'  ? true : false, 
                                            //   onChanged: (value) {
                                            //     if(controller.coreCheckPoint_2.value == 'Y') {
                                            //       controller.coreCheckPoint_2.value = 'N';
                                            //     } else {
                                            //       controller.coreCheckPoint_2.value = 'Y';
                                            //     }
                                            //   }
                                            // ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_2.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_2.value == 'Y') {
                                                    controller.coreCheckPoint_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                            
                                            // Checkbox(
                                            //   value: controller.coreCheckPoint_2.value == 'Y' ? false : true, 
                                            //   onChanged: (value) {}
                                            // ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('- 접지 시행 전 대상기기 확인', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('- 접지 시행 후 접지개폐기 투입 상태', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text('3 작업 전 안전회의', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <InlineSpan> [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                        child: Image.asset(
                                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                          height: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '작업인원 확인 및 안전장구 착용',
                                                      style: TextStyle(fontSize: 14, color: Colors.red),
                                                    ),
                                                  ]
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_3_1.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_3_1.value == 'Y') {
                                                    controller.coreCheckPoint_3_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_3_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_3_1.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_3_1.value == 'Y') {
                                                    controller.coreCheckPoint_3_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_3_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('- 안전모, 안전화, 안전대(필요시)', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <InlineSpan> [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                        child: Image.asset(
                                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                          height: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '작업전 안전회의 개최, 작업내용 교육',
                                                      style: TextStyle(fontSize: 14, color: Colors.red),
                                                    ),
                                                  ]
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_3_2.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_3_2.value == 'Y') {
                                                    controller.coreCheckPoint_3_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_3_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_3_2.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_3_2.value == 'Y') {
                                                    controller.coreCheckPoint_3_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_3_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('- 작업자 전원 참석 안전교육 및 작업내용 숙지', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <InlineSpan> [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                        child: Image.asset(
                                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                          height: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '작업안전 체크리스트 점검',
                                                      style: TextStyle(fontSize: 14, color: Colors.red),
                                                    ),
                                                  ]
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_3_3.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_3_3.value == 'Y') {
                                                    controller.coreCheckPoint_3_3.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_3_3.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_3_3.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_3_3.value == 'Y') {
                                                    controller.coreCheckPoint_3_3.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_3_3.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text('4. 작업준비', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('○ 안전담당자, 탑상작업 지상감시자 지정', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_4_1.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_4_1.value == 'Y') {
                                                    controller.coreCheckPoint_4_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_4_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_4_1.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_4_1.value == 'Y') {
                                                    controller.coreCheckPoint_4_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_4_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('○ 휴전작업 시 검전, 접지 및 사활 구분 표시', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_4_2.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_4_2.value == 'Y') {
                                                    controller.coreCheckPoint_4_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_4_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_4_2.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_4_2.value == 'Y') {
                                                    controller.coreCheckPoint_4_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_4_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <InlineSpan> [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                        child: Image.asset(
                                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                          height: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '작업개소 사활구분 표시 시행',
                                                      style: TextStyle(fontSize: 14, color: Colors.red),
                                                    ),
                                                  ]
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_4_3.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_4_3.value == 'Y') {
                                                    controller.coreCheckPoint_4_3.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_4_3.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_4_3.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_4_3.value == 'Y') {
                                                    controller.coreCheckPoint_4_3.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_4_3.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text('5, 6. 철탑 조립, 본조임 및 부착물 취부', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('○ 지상 감시자 배치', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_1.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_1.value == 'Y') {
                                                    controller.coreCheckPoint_5_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_1.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_1.value == 'Y') {
                                                    controller.coreCheckPoint_5_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20.0),
                                              child: Text('○ 적상, 적하 시 자재 포박 상태(2점지지 이상)', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_2.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_2.value == 'Y') {
                                                    controller.coreCheckPoint_5_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_2.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_2.value == 'Y') {
                                                    controller.coreCheckPoint_5_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),


                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20.0),
                                              child: Text('○ 크레인 설치', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_3.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_3.value == 'Y') {
                                                    controller.coreCheckPoint_5_3.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_3.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_3.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_3.value == 'Y') {
                                                    controller.coreCheckPoint_5_3.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_3.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 30.0),
                                              child: Text('- 외함 접지, 크레인 설치 지반 안정성', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 30.0),
                                              child: Text('- 활선구간과 크레인 적정 이격 거리 확인', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 30.0),
                                              child: Text('- 조립봉, 크레인 허용하중 이내 중량물 인양', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20.0),
                                              child: Text('○ 철탑조립 직하 지상부 출입 통제', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_4.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_4.value == 'Y') {
                                                    controller.coreCheckPoint_5_4.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_4.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_4.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_4.value == 'Y') {
                                                    controller.coreCheckPoint_5_4.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_4.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('○ 볼트류, 공구 탑상 ↔ 지상 전달시 공구함(주머니) 사용', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_5.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_5.value == 'Y') {
                                                    controller.coreCheckPoint_5_5.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_5.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_5.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_5.value == 'Y') {
                                                    controller.coreCheckPoint_5_5.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_5.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: <InlineSpan> [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                        child: Image.asset(
                                                          'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                          height: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '작업중 안전장구 착용 확인',
                                                      style: TextStyle(fontSize: 14, color: Colors.red),
                                                    ),
                                                  ]
                                                ),
                                              ),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_6.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_6.value == 'Y') {
                                                    controller.coreCheckPoint_5_6.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_6.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Obx(() => Checkbox(
                                              value: controller.coreCheckPoint_5_6.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPoint_5_6.value == 'Y') {
                                                    controller.coreCheckPoint_5_6.value = 'N';
                                                  } else {
                                                    controller.coreCheckPoint_5_6.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height: rowHeight,
                                            width: 240,
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text('- 오전, 오후 작업전 승탑자 전원 안전고리 체결 확인', style: TextStyle(fontSize: 14)),
                                            ),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: rowHeight,
                                            width: 80,
                                            child: Ui.inspectionTitleText('')
                                        ),
                                      ],
                                    ),

                                ],
                              ),
                            ],
                          ),

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
                              width: 800,
                              child: Ui.inspectionTitleText('핵심 Check Point 실적 등록', fontWeight: FontWeight.bold)
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
                                  height: rowHeight,
                                  width: 640,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('○ 실적 등록 공정 : 2. 검전 접지 3. 작업 전 안전회의 4. 작업 준비 5. 철탑조립'),
                                  ),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: const Text('확인', style: TextStyle(fontSize: 14),),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: const Text('해당없음', style: TextStyle(fontSize: 14)),
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
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  height: rowHeight,
                                  width: 640,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('○ 사진 촬영 대상 공정', style: TextStyle(fontSize: 14)),
                                  ),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  height: rowHeight,
                                  width: 80,
                                  child: Ui.inspectionTitleText('')
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: Ui.inspectionTitleText('')
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
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  height: rowHeight,
                                  width: 640,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <InlineSpan> [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Image.asset(
                                                'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                height: 16,
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '휴전선로 현장접지 시행   ',
                                            style: TextStyle(fontSize: 14, color: Colors.red)
                                          ),

                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Image.asset(
                                                'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                height: 16,
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '작업인원 확인(안전장구 착용상태 포함)   ',
                                            style: TextStyle(fontSize: 14, color: Colors.red)
                                          ),

                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Image.asset(
                                                'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                height: 16,
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '작업전 안전회의록',
                                            style: TextStyle(fontSize: 14, color: Colors.red)
                                          ),

                                        ]
                                      ),
                                    ),
                                  ),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: Obx(() => Checkbox(
                                              value: controller.coreCheckPointPerf_1.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPointPerf_1.value == 'Y') {
                                                    controller.coreCheckPointPerf_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPointPerf_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: Obx(() => Checkbox(
                                              value: controller.coreCheckPointPerf_1.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPointPerf_1.value == 'Y') {
                                                    controller.coreCheckPointPerf_1.value = 'N';
                                                  } else {
                                                    controller.coreCheckPointPerf_1.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
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
                                  height: rowHeight,
                                  width: 640,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <InlineSpan> [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Image.asset(
                                                'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                height: 16,
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '작업안전 체크리스트   ',
                                            style: TextStyle(fontSize: 14, color: Colors.red)
                                          ),

                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Image.asset(
                                                'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                height: 16,
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '작업개소 사활구분 표시 시행   ',
                                            style: TextStyle(fontSize: 14, color: Colors.red)
                                          ),

                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Image.asset(
                                                'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
                                                height: 16,
                                              ),
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '작업중 안전장구 착용 확인',
                                            style: TextStyle(fontSize: 14, color: Colors.red)
                                          ),

                                        ]
                                      ),
                                    ),
                                  ),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: Obx(() => Checkbox(
                                              value: controller.coreCheckPointPerf_2.value == 'Y' ? true : false, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPointPerf_2.value == 'Y') {
                                                    controller.coreCheckPointPerf_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPointPerf_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: rowHeight,
                                  width: 80,
                                  child: Obx(() => Checkbox(
                                              value: controller.coreCheckPointPerf_2.value == 'Y' ? false : true, 
                                              onChanged: (value) {
                                                if(controller.crud.value != 'crud-r') {
                                                  if(controller.coreCheckPointPerf_2.value == 'Y') {
                                                    controller.coreCheckPointPerf_2.value = 'N';
                                                  } else {
                                                    controller.coreCheckPointPerf_2.value = 'Y';
                                                  }
                                                }
                                              }
                                            ),),
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
                                  height: rowHeight,
                                  width: 150,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('○ 일시 :'),
                                  ),
                              ),

                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                // decoration: const BoxDecoration(
                                //   color: Colors.yellow,
                                //   border: Border(
                                //     right: BorderSide(color: Colors.black, width: 1.0),
                                //     bottom: BorderSide(color: Colors.black, width: 1.0),
                                //   ),
                                // ),
                                height: rowHeight,
                                width: 250,
                                child: MaterialButton(
                                  elevation: 0,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () async {
                                    if (controller.readOnlyYn.isFalse) {
                                      await Ui.datePicker(context, controller.chckYmd);
                                    }
                                  },
                                  child: Obx(() => Text(controller.chckYmd.value.toString().substring(0, 10), style: const TextStyle(fontSize: 14))),
                                  // child: Obx(() => Ui.inspectionTitleText(controller.chckYmd.value.toString().substring(0, 10))),
                                ),
                              ),

                              // Container(
                              //     decoration: const BoxDecoration(
                              //       border: Border(
                              //         right: BorderSide(color: Colors.black, width: 1.0),
                              //         bottom: BorderSide(color: Colors.black, width: 1.0),
                              //       ),
                              //     ),
                              //     alignment: Alignment.centerLeft,
                              //     height: rowHeight,
                              //     width: 250,
                              //     child: const Text(''),
                              // ),

                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  height: rowHeight,
                                  width: 100,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('○ 확인자 :'),
                                  ),
                              ),

                              Obx(() => Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.centerLeft,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
                                // decoration: const BoxDecoration(
                                //   color: Colors.yellow,
                                //   border: Border(
                                //     right: BorderSide(color: Colors.black, width: 1.0),
                                //     bottom: BorderSide(color: Colors.black, width: 1.0),
                                //   ),
                                // ),
                                height: rowHeight,
                                width: 140,
                                child: TextField(
                                    controller: controller.textController['chck_nm'],
                                    style: const TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.readOnlyYn.value
                                ),
                              ),),
                              // Container(
                              //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              //   alignment: Alignment.centerLeft,
                              //   // decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "rb"),
                              //   decoration: const BoxDecoration(
                              //     color: Colors.yellow,
                              //     border: Border(
                              //       right: BorderSide(color: Colors.black, width: 1.0),
                              //       bottom: BorderSide(color: Colors.black, width: 1.0),
                              //     ),
                              //   ),
                              //   height: rowHeight,
                              //   width: 140,
                              //   child: TextField(
                              //       controller: controller.textController['chck_nm'],
                              //       style: const TextStyle(fontSize: 14),
                              //       decoration: InputDecoration(
                              //           contentPadding: const EdgeInsets.all(5.0),
                              //           border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                              //       ),
                              //       readOnly: controller.readOnlyYn.value
                              //   ),
                              // ),

                              // Container(
                              //     decoration: const BoxDecoration(
                              //       border: Border(
                              //         right: BorderSide(color: Colors.black, width: 1.0),
                              //         bottom: BorderSide(color: Colors.black, width: 1.0),
                              //       ),
                              //     ),
                              //     alignment: Alignment.centerLeft,
                              //     height: rowHeight,
                              //     width: 140,
                              //     child: const Padding(
                              //       padding: EdgeInsets.only(left: 10),
                              //       child: Text(''),
                              //     ),
                              // ),

                              InkWell(
                                onTap: () async {
                                  if (controller.readOnlyYn.isFalse) {
                                    var sign = await Get.toNamed('/signature_page',
                                        arguments: {
                                          'doc_type' : controller.docType.value,
                                          'title' : '확인자'
                                        }
                                    );
                                    if (sign != null) {
                                      controller.imageUrl['chck_sign_file_name'] = sign;
                                    }
                                  }
                                },
                                child: Obx(() => Container(
                                    constraints: const BoxConstraints.tightFor(height: 40, width: 160),
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

                                    // Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
                                    //     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    //       return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                    //     }
                                    // )
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
                                // Container(
                                //     constraints: const BoxConstraints.tightFor(height: 40, width: 160),
                                //     decoration: Ui.boxDecoration(width: 1.0, borderType: "rb"),
                                //     child: controller.imageUrl["chck_sign_file_name"] == null
                                //         ?
                                //     const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3))
                                //         :
                                //     (controller.imageUrl["chck_sign_file_name"].runtimeType.toString() == "_File"
                                //         ?
                                //     Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
                                //         errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                //           return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                //         }
                                //     )

                                //     // Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
                                //     //     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                //     //       return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                //     //     }
                                //     // )
                                //         :
                                //     Image.network((global.global.value.apiFilePath! + controller.imageUrl["chck_sign_file_name"]),
                                //       loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                //         if (loadingProgress == null) {
                                //           return child;
                                //         }
                                //         return Center(
                                //           child: CircularProgressIndicator(
                                //             value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                //             color: Ui.commonColors(),
                                //           ),
                                //         );
                                //       },
                                //       errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                //         return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
                                //       },
                                //     ))
                                // ),
                              ),

                              // Container(
                              //     decoration: const BoxDecoration(
                              //       border: Border(
                              //         right: BorderSide(color: Colors.black, width: 1.0),
                              //         bottom: BorderSide(color: Colors.black, width: 1.0),
                              //       ),
                              //     ),
                              //     alignment: Alignment.centerLeft,
                              //     height: rowHeight,
                              //     width: 160,
                              //     child: const Padding(
                              //       padding: EdgeInsets.only(left: 10),
                              //       child: Text('No Sign'),
                              //     ),
                              // ),

                            ],
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
    // return GestureDetector(
    //   onTap: () {FocusScope.of(context).unfocus();},
    //   child: Scaffold(
    //     appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '작업안전 체크리스트(S17 철구 조립 및 모선배선공사)'),
    //     endDrawer: MenuButtonWidget(),
    //     bottomNavigationBar: WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
    //     body: InteractiveViewer(
    //       panEnabled: true,
    //       minScale: 1.0,
    //       maxScale: 4,
    //       child: SafeArea(
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.horizontal,
    //           child: SingleChildScrollView(
    //             scrollDirection: Axis.vertical,
    //             child: SafeArea(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(10.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Container(
    //                         decoration: BoxDecoration(
    //                           border: Border.all(),
    //                         ),
    //                         alignment: Alignment.center,
    //                         height: rowHeight,
    //                         width: 800,
    //                         child: Ui.inspectionTitleText('작업안전 체크리스트', fontWeight: FontWeight.bold)
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               color: Colors.grey,
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 200,
    //                             child: Ui.inspectionTitleText('작업공종(Code)', fontWeight: FontWeight.bold)
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 200,
    //                             child: Ui.inspectionTitleText('S17', fontWeight: FontWeight.bold)
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               color: Colors.grey,
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 400,
    //                             child: Ui.inspectionTitleText('철구 조립 및 모선배선공사', fontWeight: FontWeight.bold)
    //                         ),
    //                       ],
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               color: Colors.grey,
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 200,
    //                             child: Ui.inspectionTitleText('시공사', fontWeight: FontWeight.bold)
    //                         ),

    //                         Obx(() => Container(
    //                           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    //                           alignment: Alignment.centerLeft,
    //                           decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
    //                           height: rowHeight,
    //                           width: 200,
    //                           child: TextField(
    //                               controller: controller.textController['cstrn_entrps'],
    //                               style: const TextStyle(fontSize: 18),
    //                               decoration: InputDecoration(
    //                                   // contentPadding: const EdgeInsets.all(5.0),
    //                                   border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
    //                               ),
    //                               readOnly: controller.readOnlyYn.value
    //                           ),
    //                         ),),
    //                         // Container(
    //                         //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    //                         //   alignment: Alignment.centerLeft,
    //                         //   decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "rb"),
    //                         //   height: rowHeight,
    //                         //   width: 200,
    //                         //   child: TextField(
    //                         //       controller: controller.textController['cstrn_entrps'],
    //                         //       style: const TextStyle(fontSize: 18),
    //                         //       decoration: InputDecoration(
    //                         //           contentPadding: const EdgeInsets.all(5.0),
    //                         //           border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
    //                         //       ),
    //                         //       readOnly: controller.readOnlyYn.value
    //                         //   ),
    //                         // ),


    //                         // Container(
    //                         //     decoration: const BoxDecoration(
    //                         //       border: Border(
    //                         //         right: BorderSide(color: Colors.black, width: 1.0),
    //                         //         bottom: BorderSide(color: Colors.black, width: 1.0),
    //                         //       ),
    //                         //     ),
    //                         //     alignment: Alignment.center,
    //                         //     height: rowHeight,
    //                         //     width: 200,
    //                         //     child: Ui.inspectionTitleText('', fontWeight: FontWeight.bold)
    //                         // ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               color: Colors.grey,
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 100,
    //                             child: Ui.inspectionTitleText('공사명', fontWeight: FontWeight.bold)
    //                         ),

    //                         Obx(() => Container(
    //                           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    //                           alignment: Alignment.centerLeft,
    //                           decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
    //                           height: rowHeight,
    //                           width: 300,
    //                           child: TextField(
    //                               controller: controller.textController['cstrn_nm'],
    //                               style: const TextStyle(fontSize: 18),
    //                               decoration: InputDecoration(
    //                                   contentPadding: const EdgeInsets.all(5.0),
    //                                   border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
    //                               ),
    //                               readOnly: controller.readOnlyYn.value
    //                           ),
    //                         ),),

    //                         // Container(
    //                         //     decoration: const BoxDecoration(
    //                         //       border: Border(
    //                         //         right: BorderSide(color: Colors.black, width: 1.0),
    //                         //         bottom: BorderSide(color: Colors.black, width: 1.0),
    //                         //       ),
    //                         //     ),
    //                         //     alignment: Alignment.center,
    //                         //     height: rowHeight,
    //                         //     width: 300,
    //                         //     child: Ui.inspectionTitleText('', fontWeight: FontWeight.bold)
    //                         // ),
    //                       ],
    //                     ),

    //                     Container(
    //                       decoration: const BoxDecoration(
    //                         border: Border(
    //                           right: BorderSide(color: Colors.black, width: 1.0),
    //                           left: BorderSide(color: Colors.black, width: 1.0),
    //                         ),
    //                       ),
    //                       alignment: Alignment.centerLeft,
    //                       height: smallRowHeight,
    //                       width: 800,
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(left: 10),
    //                         child: RichText(
    //                           text: TextSpan(
    //                             children: <InlineSpan>[
    //                               const TextSpan(
    //                                 text: '※ 사진 전송방법 : ① 실적 등록대상[',
    //                                 style: TextStyle(fontSize: 16, color: Colors.black),
    //                               ),
    //                               WidgetSpan(
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                   child: Image.asset(
    //                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                     height: 16,
    //                                   ),
    //                                 ),
    //                               ),
    //                               const TextSpan(
    //                                 text: ']을 휴대폰으로 사진 촬영하여 공사번호+Code 번호 입력 후',
    //                                 style: TextStyle(fontSize: 16, color: Colors.black),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),

    //                     Container(
    //                       decoration: const BoxDecoration(
    //                         border: Border(
    //                           right: BorderSide(color: Colors.black, width: 1.0),
    //                           left: BorderSide(color: Colors.black, width: 1.0),
    //                         ),
    //                       ),
    //                       alignment: Alignment.centerLeft,
    //                       height: smallRowHeight,
    //                       width: 800,
    //                       child: const Padding(
    //                         padding: EdgeInsets.only(left: 150),
    //                         child: Text('#1230으로 전송(한글 및 특수기호 입력 시 미연계 될 수 있으니 숫자와 영문자만 입력)', style: TextStyle(fontSize: 16),),
    //                       ),
    //                     ),

    //                     Container(
    //                       decoration: const BoxDecoration(
    //                         border: Border(
    //                           right: BorderSide(color: Colors.black, width: 1.0),
    //                           left: BorderSide(color: Colors.black, width: 1.0),
    //                         ),
    //                       ),
    //                       alignment: Alignment.centerLeft,
    //                       height: smallRowHeight,
    //                       width: 800,
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(left: 127),
    //                         child: RichText(
    //                           text: TextSpan(
    //                             children: <InlineSpan>[
    //                               const TextSpan(
    //                                 text: '② 실적 등록 대상[',
    //                                 style: TextStyle(fontSize: 16, color: Colors.black),
    //                               ),
    //                               WidgetSpan(
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                   child: Image.asset(
    //                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                     height: 16,
    //                                   ),
    //                                 ),
    //                               ),
    //                               const TextSpan(
    //                                 text: ']을 안드로이드용 모바일 기기에 설치된 전용 App을 통하여',
    //                                 style: TextStyle(fontSize: 16, color: Colors.black),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),

    //                     Container(
    //                       decoration: const BoxDecoration(
    //                         border: Border(
    //                           right: BorderSide(color: Colors.black, width: 1.0),
    //                           left: BorderSide(color: Colors.black, width: 1.0),
    //                         ),
    //                       ),
    //                       alignment: Alignment.centerLeft,
    //                       height: smallRowHeight,
    //                       width: 800,
    //                       child: const Padding(
    //                         padding: EdgeInsets.only(left: 150),
    //                         child: Text('공사현장 모니터링 사진 전송(아이폰은 사용 불가)', style: TextStyle(fontSize: 16),)
    //                       ),
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               color: Colors.grey,
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 400,
    //                             child: Ui.inspectionTitleText('【 작업절차도 】', fontWeight: FontWeight.bold)
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               color: Colors.grey,
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 400,
    //                             child: Ui.inspectionTitleText('【 위험요인 】', fontWeight: FontWeight.bold)
    //                         ),
    //                       ],
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             height: rowHeight * 29,
    //                             width: 400,
    //                             child: FittedBox(
    //                               fit: BoxFit.fill,
    //                               child: Image.asset(
    //                                 'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_fig1_1.jpg',
    //                               ),
    //                             ),
    //                         ),
    //                         Column(
    //                           children: [
    //                               Container(
    //                                   decoration: const BoxDecoration(
    //                                     border: Border(
    //                                       right: BorderSide(color: Colors.black, width: 1.0),
    //                                       bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                     ),
    //                                   ),
    //                                   alignment: Alignment.centerLeft,
    //                                   height: rowHeight * 3,
    //                                   width: 400,
    //                                   child: Column(
    //                                     mainAxisAlignment: MainAxisAlignment.center,
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     children: const [
    //                                       Text('○ 감전 → 활선부위 철구 승탑 및 활선 근접', style: TextStyle(fontSize: 16),),
    //                                       Text('○ 추락 → 철구 승탑 작업 및 이동 중 헛디딤', style: TextStyle(fontSize: 16),),
    //                                       Text('○ 낙하 → 철구 승탑 후 모선 연결 작업시 자재, 공기구', style: TextStyle(fontSize: 16),),
    //                                       Text('○ 전도 → 크레인 붐 이동중, 중량물 과적, 아웃트리거 부적정', style: TextStyle(fontSize: 16),),
    //                                     ],
    //                                   ),
    //                               ),
    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         color: Colors.grey,
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Ui.inspectionTitleText('【 핵심 Check Point 】', fontWeight: FontWeight.bold)
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: const Text('확인', style: TextStyle(fontSize: 16)),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: const Text('해당없음', style: TextStyle(fontSize: 16)),
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 10),
    //                                         child: Text('2. 검전, 접지', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 10),
    //                                         child: RichText(
    //                                           text: TextSpan(
    //                                             children: <InlineSpan>[
    //                                               WidgetSpan(
    //                                                 child: Padding(
    //                                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                                   child: Image.asset(
    //                                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                                     height: 16,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const TextSpan(
    //                                                 text: '휴전선로 현장접지 시행',
    //                                                 style: TextStyle(fontSize: 14, color: Colors.red)
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('- 접지 시행 전 대상기기 확인', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('- 접지 시행 후 접지개폐기 투입 상태', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 10),
    //                                         child: Text('3 작업 전 안전회의', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 10),
    //                                         child: RichText(
    //                                           text: TextSpan(
    //                                             children: <InlineSpan> [
    //                                               WidgetSpan(
    //                                                 child: Padding(
    //                                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                                   child: Image.asset(
    //                                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                                     height: 16,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const TextSpan(
    //                                                 text: '작업인원 확인 및 안전장구 착용',
    //                                                 style: TextStyle(fontSize: 14, color: Colors.red),
    //                                               ),
    //                                             ]
    //                                           ),
    //                                         ),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('- 안전모, 안전화, 안전대(필요시)', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 10),
    //                                         child: RichText(
    //                                           text: TextSpan(
    //                                             children: <InlineSpan> [
    //                                               WidgetSpan(
    //                                                 child: Padding(
    //                                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                                   child: Image.asset(
    //                                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                                     height: 16,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const TextSpan(
    //                                                 text: '작업전 안전회의 개최, 작업내용 교육',
    //                                                 style: TextStyle(fontSize: 14, color: Colors.red),
    //                                               ),
    //                                             ]
    //                                           ),
    //                                         ),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('- 작업자 전원 참석 안전교육 및 작업내용 숙지', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 10),
    //                                         child: RichText(
    //                                           text: TextSpan(
    //                                             children: <InlineSpan> [
    //                                               WidgetSpan(
    //                                                 child: Padding(
    //                                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                                   child: Image.asset(
    //                                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                                     height: 16,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const TextSpan(
    //                                                 text: '작업안전 체크리스트 점검',
    //                                                 style: TextStyle(fontSize: 14, color: Colors.red),
    //                                               ),
    //                                             ]
    //                                           ),
    //                                         ),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 10),
    //                                         child: Text('4. 작업준비', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('○ 안전담당자, 탑상작업 지상감시자 지정', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('○ 휴전작업 시 검전, 접지 및 사활 구분 표시', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 10),
    //                                         child: RichText(
    //                                           text: TextSpan(
    //                                             children: <InlineSpan> [
    //                                               WidgetSpan(
    //                                                 child: Padding(
    //                                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                                   child: Image.asset(
    //                                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                                     height: 16,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const TextSpan(
    //                                                 text: '작업개소 사활구분 표시 시행',
    //                                                 style: TextStyle(fontSize: 14, color: Colors.red),
    //                                               ),
    //                                             ]
    //                                           ),
    //                                         ),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 10),
    //                                         child: Text('5, 6. 철탑 조립, 본조임 및 부착물 취부', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('○ 지상 감시자 배치', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20.0),
    //                                         child: Text('○ 적상, 적하 시 자재 포박 상태(2점지지 이상)', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),


    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20.0),
    //                                         child: Text('○ 크레인 설치', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 30.0),
    //                                         child: Text('- 외함 접지, 크레인 설치 지반 안정성', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 30.0),
    //                                         child: Text('- 활선구간과 크레인 적정 이격 거리 확인', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 30.0),
    //                                         child: Text('- 조립봉, 크레인 허용하중 이내 중량물 인양', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20.0),
    //                                         child: Text('○ 철탑조립 직하 지상부 출입 통제', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('○ 볼트류, 공구 탑상 ↔ 지상 전달시 공구함(주머니) 사용', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.only(left: 10),
    //                                         child: RichText(
    //                                           text: TextSpan(
    //                                             children: <InlineSpan> [
    //                                               WidgetSpan(
    //                                                 child: Padding(
    //                                                   padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                                   child: Image.asset(
    //                                                     'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                                     height: 16,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               const TextSpan(
    //                                                 text: '작업중 안전장구 착용 확인',
    //                                                 style: TextStyle(fontSize: 14, color: Colors.red),
    //                                               ),
    //                                             ]
    //                                           ),
    //                                         ),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('□')
    //                                   ),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.centerLeft,
    //                                       height: rowHeight,
    //                                       width: 240,
    //                                       child: const Padding(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         child: Text('- 오전, 오후 작업전 승탑자 전원 안전고리 체결 확인', style: TextStyle(fontSize: 14)),
    //                                       ),
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                   Container(
    //                                       decoration: const BoxDecoration(
    //                                         border: Border(
    //                                           right: BorderSide(color: Colors.black, width: 1.0),
    //                                           bottom: BorderSide(color: Colors.black, width: 1.0),
    //                                         ),
    //                                       ),
    //                                       alignment: Alignment.center,
    //                                       height: rowHeight,
    //                                       width: 80,
    //                                       child: Ui.inspectionTitleText('')
    //                                   ),
    //                                 ],
    //                               ),

    //                           ],
    //                         ),
    //                       ],
    //                     ),

    //                     Container(
    //                         decoration: const BoxDecoration(
    //                           color: Colors.grey,
    //                           border: Border(
    //                             right: BorderSide(color: Colors.black, width: 1.0),
    //                             left: BorderSide(color: Colors.black, width: 1.0),
    //                             bottom: BorderSide(color: Colors.black, width: 1.0),
    //                           ),
    //                         ),
    //                         alignment: Alignment.center,
    //                         height: rowHeight,
    //                         width: 800,
    //                         child: Ui.inspectionTitleText('핵심 Check Point 실적 등록', fontWeight: FontWeight.bold)
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 640,
    //                             child: const Padding(
    //                               padding: EdgeInsets.only(left: 10),
    //                               child: Text('○ 실적 등록 공정 : 2. 검전 접지 3. 작업 전 안전회의 4. 작업 준비 5. 철탑조립'),
    //                             ),
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: const Text('확인', style: TextStyle(fontSize: 14),),
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: const Text('해당없음', style: TextStyle(fontSize: 14)),
    //                         ),
    //                       ],
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 640,
    //                             child: const Padding(
    //                               padding: EdgeInsets.only(left: 10),
    //                               child: Text('○ 사진 촬영 대상 공정', style: TextStyle(fontSize: 14)),
    //                             ),
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: Ui.inspectionTitleText('')
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: Ui.inspectionTitleText('')
    //                         ),
    //                       ],
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 640,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(left: 10.0),
    //                               child: RichText(
    //                                 text: TextSpan(
    //                                   children: <InlineSpan> [
    //                                     WidgetSpan(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                         child: Image.asset(
    //                                           'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                           height: 16,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     const TextSpan(
    //                                       text: '휴전선로 현장접지 시행   ',
    //                                       style: TextStyle(fontSize: 14, color: Colors.red)
    //                                     ),

    //                                     WidgetSpan(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                         child: Image.asset(
    //                                           'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                           height: 16,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     const TextSpan(
    //                                       text: '작업인원 확인(안전장구 착용상태 포함)   ',
    //                                       style: TextStyle(fontSize: 14, color: Colors.red)
    //                                     ),

    //                                     WidgetSpan(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                         child: Image.asset(
    //                                           'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                           height: 16,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     const TextSpan(
    //                                       text: '작업전 안전회의록',
    //                                       style: TextStyle(fontSize: 14, color: Colors.red)
    //                                     ),

    //                                   ]
    //                                 ),
    //                               ),
    //                             ),
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: Ui.inspectionTitleText('□')
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: Ui.inspectionTitleText('□')
    //                         ),
    //                       ],
    //                     ),


    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 640,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(left: 10.0),
    //                               child: RichText(
    //                                 text: TextSpan(
    //                                   children: <InlineSpan> [
    //                                     WidgetSpan(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                         child: Image.asset(
    //                                           'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                           height: 16,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     const TextSpan(
    //                                       text: '작업안전 체크리스트   ',
    //                                       style: TextStyle(fontSize: 14, color: Colors.red)
    //                                     ),

    //                                     WidgetSpan(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                         child: Image.asset(
    //                                           'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                           height: 16,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     const TextSpan(
    //                                       text: '작업개소 사활구분 표시 시행   ',
    //                                       style: TextStyle(fontSize: 14, color: Colors.red)
    //                                     ),

    //                                     WidgetSpan(
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
    //                                         child: Image.asset(
    //                                           'assets/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_camera.jpg',
    //                                           height: 16,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     const TextSpan(
    //                                       text: '작업중 안전장구 착용 확인',
    //                                       style: TextStyle(fontSize: 14, color: Colors.red)
    //                                     ),

    //                                   ]
    //                                 ),
    //                               ),
    //                             ),
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: Ui.inspectionTitleText('□')
    //                         ),
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.center,
    //                             height: rowHeight,
    //                             width: 80,
    //                             child: Ui.inspectionTitleText('□')
    //                         ),
    //                       ],
    //                     ),

    //                     Row(
    //                       children: [
    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 left: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 150,
    //                             child: const Padding(
    //                               padding: EdgeInsets.only(left: 10),
    //                               child: Text('○ 일시 :'),
    //                             ),
    //                         ),

    //                         Container(
    //                           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    //                           alignment: Alignment.center,
    //                           decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
    //                           // decoration: const BoxDecoration(
    //                           //   color: Colors.yellow,
    //                           //   border: Border(
    //                           //     right: BorderSide(color: Colors.black, width: 1.0),
    //                           //     bottom: BorderSide(color: Colors.black, width: 1.0),
    //                           //   ),
    //                           // ),
    //                           height: rowHeight,
    //                           width: 250,
    //                           child: MaterialButton(
    //                             elevation: 0,
    //                             padding: const EdgeInsets.all(0),
    //                             onPressed: () async {
    //                               if (controller.readOnlyYn.isFalse) {
    //                                 await Ui.datePicker(context, controller.chckYmd);
    //                               }
    //                             },
    //                             child: Obx(() => Text(controller.chckYmd.value.toString().substring(0, 10), style: const TextStyle(fontSize: 14))),
    //                             // child: Obx(() => Ui.inspectionTitleText(controller.chckYmd.value.toString().substring(0, 10))),
    //                           ),
    //                         ),

    //                         // Container(
    //                         //     decoration: const BoxDecoration(
    //                         //       border: Border(
    //                         //         right: BorderSide(color: Colors.black, width: 1.0),
    //                         //         bottom: BorderSide(color: Colors.black, width: 1.0),
    //                         //       ),
    //                         //     ),
    //                         //     alignment: Alignment.centerLeft,
    //                         //     height: rowHeight,
    //                         //     width: 250,
    //                         //     child: const Text(''),
    //                         // ),

    //                         Container(
    //                             decoration: const BoxDecoration(
    //                               border: Border(
    //                                 right: BorderSide(color: Colors.black, width: 1.0),
    //                                 bottom: BorderSide(color: Colors.black, width: 1.0),
    //                               ),
    //                             ),
    //                             alignment: Alignment.centerLeft,
    //                             height: rowHeight,
    //                             width: 100,
    //                             child: const Padding(
    //                               padding: EdgeInsets.only(left: 10),
    //                               child: Text('○ 확인자 :'),
    //                             ),
    //                         ),

    //                         Obx(() => Container(
    //                           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    //                           alignment: Alignment.centerLeft,
    //                           decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
    //                           // decoration: const BoxDecoration(
    //                           //   color: Colors.yellow,
    //                           //   border: Border(
    //                           //     right: BorderSide(color: Colors.black, width: 1.0),
    //                           //     bottom: BorderSide(color: Colors.black, width: 1.0),
    //                           //   ),
    //                           // ),
    //                           height: rowHeight,
    //                           width: 140,
    //                           child: TextField(
    //                               controller: controller.textController['chck_nm'],
    //                               style: const TextStyle(fontSize: 14),
    //                               decoration: InputDecoration(
    //                                   contentPadding: const EdgeInsets.all(5.0),
    //                                   border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
    //                               ),
    //                               readOnly: controller.readOnlyYn.value
    //                           ),
    //                         ),),
    //                         // Container(
    //                         //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    //                         //   alignment: Alignment.centerLeft,
    //                         //   // decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "rb"),
    //                         //   decoration: const BoxDecoration(
    //                         //     color: Colors.yellow,
    //                         //     border: Border(
    //                         //       right: BorderSide(color: Colors.black, width: 1.0),
    //                         //       bottom: BorderSide(color: Colors.black, width: 1.0),
    //                         //     ),
    //                         //   ),
    //                         //   height: rowHeight,
    //                         //   width: 140,
    //                         //   child: TextField(
    //                         //       controller: controller.textController['chck_nm'],
    //                         //       style: const TextStyle(fontSize: 14),
    //                         //       decoration: InputDecoration(
    //                         //           contentPadding: const EdgeInsets.all(5.0),
    //                         //           border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
    //                         //       ),
    //                         //       readOnly: controller.readOnlyYn.value
    //                         //   ),
    //                         // ),

    //                         // Container(
    //                         //     decoration: const BoxDecoration(
    //                         //       border: Border(
    //                         //         right: BorderSide(color: Colors.black, width: 1.0),
    //                         //         bottom: BorderSide(color: Colors.black, width: 1.0),
    //                         //       ),
    //                         //     ),
    //                         //     alignment: Alignment.centerLeft,
    //                         //     height: rowHeight,
    //                         //     width: 140,
    //                         //     child: const Padding(
    //                         //       padding: EdgeInsets.only(left: 10),
    //                         //       child: Text(''),
    //                         //     ),
    //                         // ),

    //                         InkWell(
    //                           onTap: () async {
    //                             if (controller.readOnlyYn.isFalse) {
    //                               var sign = await Get.toNamed('/signature_page',
    //                                   arguments: {
    //                                     'doc_type' : controller.docType.value,
    //                                     'title' : '확인자'
    //                                   }
    //                               );
    //                               if (sign != null) {
    //                                 controller.imageUrl['chck_sign_file_name'] = sign;
    //                               }
    //                             }
    //                           },
    //                           child: Obx(() => Container(
    //                               constraints: const BoxConstraints.tightFor(height: 40, width: 160),
    //                               decoration: Ui.boxDecoration(crud: controller.crud.value, width: 1.0, borderType: "rb"),
    //                               alignment: Alignment.center,
    //                               child: controller.imageUrl["chck_sign_file_name"] == null
    //                                   ?
    //                               const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14))
    //                                   :
    //                               (controller.imageUrl["chck_sign_file_name"].runtimeType.toString() == "_File"
    //                                   ?
    //                               Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
    //                                   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //                                     return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14));
    //                                   }
    //                               )

    //                               // Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
    //                               //     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //                               //       return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
    //                               //     }
    //                               // )
    //                                   :
    //                               Image.network((global.global.value.apiFilePath! + controller.imageUrl["chck_sign_file_name"]),
    //                                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    //                                   if (loadingProgress == null) {
    //                                     return child;
    //                                   }
    //                                   return Center(
    //                                     child: CircularProgressIndicator(
    //                                       value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
    //                                       color: Ui.commonColors(),
    //                                     ),
    //                                   );
    //                                 },
    //                                 errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //                                   return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
    //                                 },
    //                               ))
    //                           ),),
    //                           // Container(
    //                           //     constraints: const BoxConstraints.tightFor(height: 40, width: 160),
    //                           //     decoration: Ui.boxDecoration(width: 1.0, borderType: "rb"),
    //                           //     child: controller.imageUrl["chck_sign_file_name"] == null
    //                           //         ?
    //                           //     const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3))
    //                           //         :
    //                           //     (controller.imageUrl["chck_sign_file_name"].runtimeType.toString() == "_File"
    //                           //         ?
    //                           //     Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
    //                           //         errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //                           //           return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
    //                           //         }
    //                           //     )

    //                           //     // Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
    //                           //     //     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //                           //     //       return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
    //                           //     //     }
    //                           //     // )
    //                           //         :
    //                           //     Image.network((global.global.value.apiFilePath! + controller.imageUrl["chck_sign_file_name"]),
    //                           //       loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    //                           //         if (loadingProgress == null) {
    //                           //           return child;
    //                           //         }
    //                           //         return Center(
    //                           //           child: CircularProgressIndicator(
    //                           //             value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
    //                           //             color: Ui.commonColors(),
    //                           //           ),
    //                           //         );
    //                           //       },
    //                           //       errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
    //                           //         return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 3.3));
    //                           //       },
    //                           //     ))
    //                           // ),
    //                         ),

    //                         // Container(
    //                         //     decoration: const BoxDecoration(
    //                         //       border: Border(
    //                         //         right: BorderSide(color: Colors.black, width: 1.0),
    //                         //         bottom: BorderSide(color: Colors.black, width: 1.0),
    //                         //       ),
    //                         //     ),
    //                         //     alignment: Alignment.centerLeft,
    //                         //     height: rowHeight,
    //                         //     width: 160,
    //                         //     child: const Padding(
    //                         //       padding: EdgeInsets.only(left: 10),
    //                         //       child: Text('No Sign'),
    //                         //     ),
    //                         // ),

    //                       ],
    //                     ),

    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}