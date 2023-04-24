import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/daily_work_report_controller.dart';
import './daily_work_report_bottom_widget.dart';
import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../services/global_service.dart';

class DailyWorkReportViewWidget extends GetView<DailyWorkReportController> {
  DailyWorkReportViewWidget({Key ? key}) : super(key: key);

  final global = Get.find<GlobalService>();
  final smallRowHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }


    return GestureDetector(
      onTap: () {FocusScope.of(context).unfocus();},
      child: Scaffold(
        appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '작업일보'),
        endDrawer: MenuButtonWidget(),
        bottomNavigationBar: DailyWorkReportBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
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
                    child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(),
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 100,
                                    child: Ui.inspectionTitleText('공사명')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rlb'),
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 100,
                                    child: Ui.inspectionTitleText('일자')
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      alignment: Alignment.center,
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                      height: 60,
                                      width: 150,
                                      child: TextField(
                                        controller: controller.textController['sub_sttn_nm'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(5.0),
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                        ),
                                        readOnly: controller.readOnlyYn.value,
                                      ),
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'trb'),
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 50,
                                        child: Ui.inspectionTitleText('S/S')
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                        height: 60,
                                        width: 300,
                                        child: TextField(
                                          controller: controller.textController['eqp_nm'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                          ),
                                          readOnly: controller.readOnlyYn.value,
                                        ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: 60,
                                  width: 500,
                                  child: MaterialButton(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () async {
                                      if (controller.readOnlyYn.isFalse) {
                                        await Ui.datePicker(context, controller.chckYmd);
                                      }
                                    },
                                    child: Obx(() => Ui.inspectionTitleText(controller.chckYmd.value.toString().substring(0, 10))),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'trb'),
                                alignment: Alignment.center,
                                height: 120,
                                width: 100,
                                child: Ui.inspectionTitleText('공정률'),
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'trb'),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 100,
                                    child: Ui.inspectionTitleText('계획'),
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 100,
                                    child: Ui.inspectionTitleText('실적'),
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 100,
                                    child: Ui.inspectionTitleText('대비'),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                        height: 40,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['prcrate_plan'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                          ),
                                          readOnly: controller.readOnlyYn.value,
                                        ),
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'trb'),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 50,
                                        child: Ui.inspectionTitleText('%'),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                        height: 40,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['prcrate_record'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                          ),
                                          readOnly: controller.readOnlyYn.value,
                                        ),
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 50,
                                        child: Ui.inspectionTitleText('%'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                        height: 40,
                                        width: 100,
                                        child: TextField(
                                          controller: controller.textController['prcrate_provi'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                          ),
                                          readOnly: controller.readOnlyYn.value,
                                        ),
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 50,
                                        child: Ui.inspectionTitleText('%'),
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
                                    height: 40,
                                    width: 100,
                                    child: Ui.inspectionTitleText('날씨'),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 80,
                                    width: 100,
                                    child: TextField(
                                      controller: controller.textController['weather'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),
                                      ),
                                      readOnly: controller.readOnlyYn.value,
                                    ),
                                ),
                                // Visibility(
                                //   visible: controller.textFieldShow.value,
                                //   child: Container(
                                //     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                //     alignment: Alignment.centerLeft,
                                //     decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                                //     height: 80,
                                //     width: 100,
                                //     child: TextField(
                                //         controller: controller.textController['weather'],
                                //         textAlign: TextAlign.center,
                                //         style: const TextStyle(fontSize: 18),
                                //         decoration: InputDecoration(
                                //             contentPadding: const EdgeInsets.all(5.0),
                                //             border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                //         ),
                                //         readOnly: controller.readOnlyYn.value
                                //     ),
                                //   ),
                                // ),
                                // Container(
                                //     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                //     alignment: Alignment.centerLeft,
                                //     decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                                //     height: 80,
                                //     width: 100,
                                //     child: DropdownButton(
                                //         isExpanded: true,
                                //         alignment: AlignmentDirectional.center,
                                //         hint: Ui.inspectionTitleText('맑음'),
                                //         // getx 오류로 인한 초기 null 처리.
                                //         value: controller.weatherValue.isEmpty ? null : controller.weatherValue.value,
                                //         items: List.generate(controller.checkWeather.length, (index) {
                                //           return DropdownMenuItem(
                                //               alignment: AlignmentDirectional.center,
                                //               value: controller.checkWeather[index],
                                //               child: Ui.inspectionTitleText(controller.checkWeather[index])
                                //           );
                                //         }),
                                //         onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                //           controller.weatherValue.value = value.toString();
                                //           // '해당없음' 선택 시, 측정치 비활성화
                                //           if (value == '직접입력') {
                                //             controller.textFieldShow.value = true;
                                //             controller.textController['weather']?.text = '';
                                //           } else {
                                //             controller.textFieldShow.value = false;
                                //             controller.textController['weather']?.text = value.toString();
                                //           }
                                //           controller.update();     // GetBuilder 사용으로 인한 update 처리
                                //         }
                                //     )
                                // ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'trb'),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 150,
                                    child: Ui.inspectionTitleText('온도'),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 70,
                                        child: Ui.inspectionTitleText('최저'),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                        height: 40,
                                        width: 80,
                                        child: TextField(
                                          controller: controller.textController['low_temp'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                          ),
                                          readOnly: controller.readOnlyYn.value,
                                        ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 70,
                                        child: Ui.inspectionTitleText('최고'),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                        height: 40,
                                        width: 80,
                                        child: TextField(
                                          controller: controller.textController['high_temp'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                          ),
                                          readOnly: controller.readOnlyYn.value,
                                        ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            // decoration: Ui.boxDecoration(borderType: 'rlb'),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(179, 103, 129, 141),
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                left: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: smallRowHeight,
                            width: 1200,
                            child: Ui.inspectionTitleText('공정률', fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rlb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('위치'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 350,
                                child: Ui.inspectionTitleText('구분'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 150,
                                child: Ui.inspectionTitleText('설계'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 150,
                                child: Ui.inspectionTitleText('전일'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 150,
                                child: Ui.inspectionTitleText('금일'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 150,
                                child: Ui.inspectionTitleText('누계'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 150,
                                child: Ui.inspectionTitleText('비고'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rlb'),
                                alignment: Alignment.center,
                                height: smallRowHeight * 6,
                                width: 100,
                                child: Ui.inspectionTitleText('단\n위\n공\n정\n별\n공\n정\n률'),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 350,
                                  child: TextField(
                                    controller: controller.textController['prcrate_div_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 350,
                                  child: TextField(
                                    controller: controller.textController['prcrate_div_2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),                                  
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 350,
                                  child: TextField(
                                    controller: controller.textController['prcrate_div_3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),                                  
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 350,
                                  child: TextField(
                                    controller: controller.textController['prcrate_div_4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),                                  
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 350,
                                  child: TextField(
                                    controller: controller.textController['prcrate_div_5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),                                  
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 350,
                                    child: Ui.inspectionTitleText('전체', fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_des_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_des_2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_des_3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_des_4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_des_5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_des_6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_ystd_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_ystd_2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_ystd_3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_ystd_4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_ystd_5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_ystd_6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_tod_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_tod_2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_tod_3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_tod_4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_tod_5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_tod_6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_sum_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_sum_2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_sum_3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_sum_4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_sum_5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_sum_6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_rmrk_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_rmrk_2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_rmrk_3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_rmrk_4'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_rmrk_5'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                  height: smallRowHeight,
                                  width: 150,
                                  child: TextField(
                                    controller: controller.textController['prcrate_rmrk_6'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5.0),
                                      border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                    ),
                                    readOnly: controller.readOnlyYn.value,
                                  ),
                                ),
                              ],
                            ),                                                                                    
                          ],
                        ),

                        Container(
                            // decoration: Ui.boxDecoration(borderType: 'rlb'),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(179, 103, 129, 141),
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                left: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: smallRowHeight,
                            width: 1200,
                            child: Ui.inspectionTitleText('작업내용', fontWeight: FontWeight.bold),
                        ),

                        Row(
                          children: [
                            Container(
                                // decoration: Ui.boxDecoration(borderType: 'rlb'),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(179, 103, 129, 141),
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 600,
                                child: Ui.inspectionTitleText('금일', fontWeight: FontWeight.bold),
                            ),
                            Container(
                                // decoration: Ui.boxDecoration(borderType: 'rb'),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(179, 103, 129, 141),
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 600,
                                child: Ui.inspectionTitleText('명일', fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tod_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 600,
                              child: TextField(
                                controller: controller.textController['oper_tom_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                // decoration: Ui.boxDecoration(borderType: 'rlb'),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(179, 103, 129, 141),
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('인원투입현황', fontWeight: FontWeight.bold),
                            ),
                            Container(
                                // decoration: Ui.boxDecoration(borderType: 'rlb'),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(179, 103, 129, 141),
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('장비투입현황', fontWeight: FontWeight.bold),
                            ),
                            Container(
                                // decoration: Ui.boxDecoration(borderType: 'rlb'),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(179, 103, 129, 141),
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('투입장비명', fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rlb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('구분'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('전일'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('금일'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('누계'),
                            ),

                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('장비명'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('전일'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('금일'),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('누계'),
                            ),
                            // Container(
                            //     decoration: Ui.boxDecoration(borderType: 'rb'),
                            //     alignment: Alignment.center,
                            //     height: smallRowHeight,
                            //     width: 400,
                            //     child: Ui.inspectionTitleText(''),
                            // ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_1'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_3'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_4'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_5'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_6'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_div_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_nm_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_7'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(borderType: 'rlb'),
                              height: smallRowHeight,
                              width: 100,
                              child: Ui.inspectionTitleText('계'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_ystd_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tod_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['man_hours_tot_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: Ui.inspectionTitleText('계'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_ystd_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tod_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['equ_tot_8'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 400,
                              child: TextField(
                                controller: controller.textController['equ_alloca_nm_9'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('대영종합산기(주)'),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 300,
                                child: Ui.inspectionTitleText(''),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: Ui.inspectionTitleText('시공관리책임자'),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              alignment: Alignment.center,
                              decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                              height: smallRowHeight,
                              width: 100,
                              child: TextField(
                                controller: controller.textController['spvs_nm'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                ),
                                readOnly: controller.readOnlyYn.value,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (controller.readOnlyYn.isFalse) {
                                  var sign = await Get.toNamed('/signature_page',
                                      arguments: {
                                        'doc_type' : controller.docType.value,
                                        'title' : '감독자'
                                      }
                                  );
                                  if (sign != null) {
                                    controller.imageUrl['spvs_sign_file_name'] = sign;
                                  }
                                }
                              },
                              child: Container(
                                  constraints: const BoxConstraints.tightFor(height: 60, width: 70),
                                  decoration: Ui.boxDecoration(width: 0.0, borderType: "trb"),
                                  child: controller.imageUrl["spvs_sign_file_name"] == null
                                          ? const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3))
                                          : (controller.imageUrl["spvs_sign_file_name"].runtimeType.toString() == "_File"
                                              ? Image.file(File(controller.imageUrl["spvs_sign_file_name"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3));
                                                })
                                              : Image.network((global.global.value.apiFilePath! + controller.imageUrl["spvs_sign_file_name"]),
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
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3));
                                                },
                                              ))
                              ),
                            ),
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
      ),
    );
  }
}