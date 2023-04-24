import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable11ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable11ViewWidget({Key? key}) : super(key: key);

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
                        width: 120,
                        child: Ui.inspectionTitleText('점검항목')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        child: Ui.inspectionTitleText('점  검  내  용')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 100,
                        child: Ui.inspectionTitleText('기    준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 180,
                        child: Ui.inspectionTitleText('점  검  결  과')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('비    고')
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
                                width: 120,
                                child: Ui.inspectionTitleText('동작시험')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('무부하 투입시간 측정'),
                                    Ui.inspectionTitleText('(정격 동작전압 : 125V)')
                                  ],
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
                                width: 120,
                                child: Ui.inspectionTitleText('"')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 60,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Ui.inspectionTitleText('무부하 개극시간 측정'),
                                    Ui.inspectionTitleText('(정격 동작전압 : 125V)')
                                  ],
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rlb'),
                                alignment: Alignment.center,
                                height: 190,
                                width: 50,
                                child: Ui.inspectionTitleText('3')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 190,
                                width: 120,
                                child: Ui.inspectionTitleText('"')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 190,
                                width: 200,
                                child: Ui.inspectionTitleText('O-C-O')
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.center,
                        height: 310,
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('최종검수'),
                            Ui.inspectionTitleText('시험성적서'),
                            Ui.inspectionTitleText('참조')
                          ],
                        )
                    ),
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 15.0),
                            alignment: Alignment.center,
                            decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                            height: 60,
                            width: 180,
                            child: Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: TextField(
                                        controller: controller.textController['chck_rslt_11-1'],
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
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 30,
                                      child: Ui.inspectionTitleText('ms')
                                  ),
                                ]
                            ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          alignment: Alignment.center,
                          decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                          height: 60,
                          width: 180,
                          child: Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: TextField(
                                      controller: controller.textController['chck_rslt_11-2'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(5.0),
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                      ),
                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                      readOnly: controller.readOnlyYn.value
                                  )
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 30,
                                    child: Ui.inspectionTitleText('ms')
                                ),
                              ]
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          alignment: Alignment.center,
                          decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                          height: 190,
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                          controller: controller.textController['chck_rslt_11-3-1'],
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
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 30,
                                        child: Ui.inspectionTitleText('ms')
                                    ),
                                  ]
                              ),
                              Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                          controller: controller.textController['chck_rslt_11-3-2'],
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
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 30,
                                        child: Ui.inspectionTitleText('ms')
                                    ),
                                  ]
                              ),
                              Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: TextField(
                                          controller: controller.textController['chck_rslt_11-3-3'],
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
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 30,
                                        child: Ui.inspectionTitleText('ms')
                                    ),
                                  ]
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                        height: 310,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['rmrk_11'],
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
                        )
                    ),
                  ],
                ),
              ],
            ))
          ),
        ),
      ),
    );
  }
}