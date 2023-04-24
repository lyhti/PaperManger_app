import 'dart:io';

import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../services/global_service.dart';
import './ct_scrmrs_bottom_widget.dart';
import '../controller/CtScrmrsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CtScrmrsViewWidget extends GetView<CtScrmrsController> {
  final global = Get.find<GlobalService>();

  CtScrmrsViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    return GetBuilder<CtScrmrsController>(init: CtScrmrsController(), builder: (controller) {
      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: MainAppBarWidget(appBar: AppBar(), subTitle: 'CT 2차회로 저항 측정 기록표'),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: CtScrmrsBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 100,
                                          child: Ui.inspectionTitleText('점검구분')
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                        height: 60,
                                        width: 150,
                                        child: TextField(
                                            controller: controller.textController['chck_dvs'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'trb'),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 100,
                                          child: Ui.inspectionTitleText('점검일자')
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.centerLeft,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'tb'),
                                        height: 60,
                                        width: 130,
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
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rlb'),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 100,
                                          child: Ui.inspectionTitleText('날씨')
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                        height: 60,
                                        width: 150,
                                        child: TextField(
                                            controller: controller.textController['weather'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 100,
                                          child: Ui.inspectionTitleText('기온')
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        alignment: Alignment.center,
                                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                        height: 60,
                                        width: 90,
                                        child: TextField(
                                            controller: controller.textController['tmpt'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Ui.inspectionTitleText('℃')
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                  decoration: Ui.boxDecoration(),
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: 70,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Ui.inspectionTitleText('결'),
                                      Ui.inspectionTitleText(''),
                                      Ui.inspectionTitleText('제')
                                    ],
                                  )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'trb'),
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 80,
                                          child: Ui.inspectionTitleText('담 당')
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'trb'),
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 80,
                                          child: Ui.inspectionTitleText('차 장')
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            var sign = await Get.toNamed('/signature_page',
                                                arguments: {
                                                  'doc_type' : controller.docType.value,
                                                  'title' : '점검자'
                                                }
                                            );
                                            if (sign != null) {
                                              controller.imageUrl['spvs_sign_file_name'] = sign;
                                            }
                                          }
                                        },
                                        child: Container(
                                            constraints: const BoxConstraints.tightFor(height: 80, width: 80),
                                            decoration: Ui.boxDecoration(width: 0.5, borderType: "rb"),
                                            child: controller.imageUrl["spvs_sign_file_name"] == null
                                                ?
                                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 4.1))
                                                :
                                            (controller.imageUrl["spvs_sign_file_name"].runtimeType.toString() == "_File"
                                                ?
                                            Image.file(File(controller.imageUrl["spvs_sign_file_name"].path),
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 4.1));
                                                }
                                            )
                                                :
                                            Image.network((global.global.value.apiFilePath! + controller.imageUrl["spvs_sign_file_name"]),
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
                                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 4.1));
                                              },
                                            ))
                                        ),
                                      ),
                                      Container(
                                          constraints: const BoxConstraints.tightFor(height: 80, width: 80),
                                          decoration: Ui.boxDecoration(width: 0.5, borderType: "rb"),
                                          child: null
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('설   치   장   소')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['sub_sttn_nm'],
                                    focusNode: controller.focusNode['sub_sttn_nm'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('설      비      명')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['eqp_nm'],
                                    focusNode: controller.focusNode['eqp_nm'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('Ry   제 원')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['ry_spc'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: 300,
                                  child: Ui.inspectionTitleText('CT 2차회로 경로')
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 540,
                                    child: TextField(
                                        controller: controller.textController['ct_secon_crct_paway_1'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(5.0),
                                            border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                        ),
                                        readOnly: controller.readOnlyYn.value
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 540,
                                    child: TextField(
                                        controller: controller.textController['ct_secon_crct_paway_2'],
                                        textAlign: TextAlign.start,
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
                          Row(
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('CT 케이블 길이')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['ct_cable_leng'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('CT 케이블 규격')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['ct_cable_stnd'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('접속개소   수량')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['cntn_zone_qaty'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('계      측      기')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['msrm_inmt'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('측      정      자')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['msrm_nm'],
                                    textAlign: TextAlign.start,
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
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 300,
                                  child: Ui.inspectionTitleText('측   정   위   치')
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 540,
                                child: TextField(
                                    controller: controller.textController['msrm_lctn'],
                                    textAlign: TextAlign.start,
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
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 300,
                                  child: Ui.inspectionTitleText('기      준      치', fontWeight: FontWeight.bold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'trb'),
                                  height: 50,
                                  width: 540,
                                  child: Row(
                                    children: [
                                      Ui.inspectionTitleText('측정일자 : '),
                                      Ui.inspectionTitleText('             .       .       .'),
                                      const SizedBox(width: 100),
                                      Ui.inspectionTitleText('단위 : mΩ'),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rlb'),
                                height: 60,
                                width: 420,
                                child: TextField(
                                    controller: controller.textController['crtr_type_1'],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: InputBorder.none
                                    ),
                                    readOnly: true
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                height: 60,
                                width: 420,
                                child: TextField(
                                    controller: controller.textController['crtr_type_2'],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: InputBorder.none
                                    ),
                                    readOnly: true
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-B')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rlb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_ry_a-b'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-C')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_ry_b-c'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-A')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_ry_c-a'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_ry_a-n'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_ry_b-n'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_ry_c-n'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-B')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_met_a-b'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-C')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_met_b-c'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-A')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_met_c-a'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_met_a-n'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_met_b-n'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: 'crud-r', borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['crtr_met_c-n'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: InputBorder.none
                                        ),
                                        readOnly: true
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 300,
                                  child: Ui.inspectionTitleText('측      정      치', fontWeight: FontWeight.bold)
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  alignment: Alignment.center,
                                  decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                  height: 50,
                                  width: 540,
                                  child: Row(
                                    children: [
                                      Ui.inspectionTitleText('측정일자 : '),
                                      MaterialButton(
                                        elevation: 0,
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () async {
                                          if (controller.readOnlyYn.isFalse) {
                                            await Ui.datePicker(context, controller.msrmChckYmd);
                                          }
                                        },
                                        child: Obx(() => Ui.inspectionTitleText(controller.msrmChckYmd.value.toString().substring(0, 10))),
                                      ),
                                      const SizedBox(width: 150),
                                      Ui.inspectionTitleText('단위 : mΩ'),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                                height: 60,
                                width: 420,
                                child: TextField(
                                    controller: controller.textController['msrm_type_1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    readOnly: controller.readOnlyYn.value
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 420,
                                child: TextField(
                                    controller: controller.textController['msrm_type_2'],
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
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-B')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rlb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_ry_a-b'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-C')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_ry_b-c'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-A')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_ry_c-a'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_ry_a-n'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_ry_b-n'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_ry_c-n'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-B')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_met_a-b'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-C')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_met_b-c'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-A')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_met_c-a'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('A-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_met_a-n'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('B-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_met_b-n'],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 70,
                                      child: Ui.inspectionTitleText('C-N')
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    alignment: Alignment.center,
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                    height: 60,
                                    width: 70,
                                    child: TextField(
                                        controller: controller.textController['msrm_met_c-n'],
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      child: Ui.inspectionTitleText('※ 배전선로 계전기내부저항의 차이로 각 상의 측정값이 차이를 보일 수 있음')
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      child: Ui.inspectionTitleText('- 계전기 제작사에 확인 요망')
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
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
}