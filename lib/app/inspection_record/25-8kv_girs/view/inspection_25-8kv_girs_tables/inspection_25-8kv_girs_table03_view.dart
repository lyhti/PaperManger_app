import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable03ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable03ViewWidget({Key? key}) : super(key: key);

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
                        width: 200,
                        child: Ui.inspectionTitleText('구분')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 300,
                        child: Ui.inspectionTitleText('점검결과(점검 전/후)')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 320,
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
                        width: 100,
                        child: Ui.inspectionTitleText('1')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        width: 200,
                        child: Ui.inspectionTitleText('차단기 동작횟수')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 120,
                        child: TextField(
                            controller: controller.textController['chck_rslt_3-1-1'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 10,
                        child: Ui.inspectionTitleText('/')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 120,
                        child: TextField(
                            controller: controller.textController['chck_rslt_3-1-2'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            readOnly: controller.readOnlyYn.value
                        ),
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 60,
                        width: 50,
                        child: Ui.inspectionTitleText('회')
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 60,
                        width: 320,
                        child: TextField(
                            controller: controller.textController['rmrk_3-1'],
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
                        height: 180,
                        width: 100,
                        child: Ui.inspectionTitleText('2')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 180,
                        width: 140,
                        child: Ui.inspectionTitleText('SF6 Gas 압력')
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('CB')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['cb_chck_rslt_3-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['cb_chck_rslt_3-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 90,
                                child: Ui.inspectionTitleText('[kg.f/cm²]')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 80,
                                child: Ui.inspectionTitleText('정격 : ')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['cb_rmrk_3-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 90,
                                child: Ui.inspectionTitleText('[kg.f/cm²]')
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('#1 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds1_chck_rslt_3-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds1_chck_rslt_3-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 90,
                                child: Ui.inspectionTitleText('[kg.f/cm²]')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 80,
                                child: Ui.inspectionTitleText('정격 : ')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['ds1_rmrk_3-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 90,
                                child: Ui.inspectionTitleText('[kg.f/cm²]')
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                child: Ui.inspectionTitleText('#2 DS')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds2_chck_rslt_3-2-1'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 10,
                                child: Ui.inspectionTitleText('/')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['ds2_chck_rslt_3-2-2'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 90,
                                child: Ui.inspectionTitleText('[kg.f/cm²]')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 80,
                                child: Ui.inspectionTitleText('정격 : ')
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                alignment: Alignment.center,
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                height: 60,
                                width: 150,
                                child: TextField(
                                    controller: controller.textController['ds2_rmrk_3-2-3'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    readOnly: controller.readOnlyYn.value
                                ),
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 90,
                                child: Ui.inspectionTitleText('[kg.f/cm²]')
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