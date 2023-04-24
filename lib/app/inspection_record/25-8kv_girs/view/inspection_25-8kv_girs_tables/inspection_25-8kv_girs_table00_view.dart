import 'dart:io';

import '../../../../../common/circular_loading_widget.dart';
import '../../../../../common/ui.dart';
import '../../../../../common/util.dart';
import '../../../../../services/global_service.dart';
import '../../../../empty_view.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable00ViewWidget extends GetView<Inspection258kvGirsController> {
  final global = Get.find<GlobalService>();

  Inspection258kvGirsTable00ViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading.isFalse) {
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ui.inspectionTitleText('공사명 : '),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 400,
                        child: TextField(
                            controller: controller.textController['cstrn_nm'],
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
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('변전소 및 기기명 : ')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 200,
                        child: TextField(
                            controller: controller.textController['sub_sttn_nm'],
                            focusNode: controller.focusNode['sub_sttn_nm'],
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
                          child: Ui.inspectionTitleText('S/S')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['eqp_nm'],
                            focusNode: controller.focusNode['eqp_nm'],
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
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('점검일자 : ')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
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
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('날씨 :')
                      ),
                      Visibility(
                        visible: controller.textFieldShow.value,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          alignment: Alignment.centerLeft,
                          decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                          height: 60,
                          width: 120,
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
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          alignment: Alignment.centerLeft,
                          decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                          height: 60,
                          width: 120,
                          child: DropdownButton(
                              isExpanded: true,
                              alignment: AlignmentDirectional.center,
                              hint: Ui.inspectionTitleText('맑음'),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.weatherValue.isEmpty ? null : controller.weatherValue.value,
                              items: List.generate(controller.checkWeather.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkWeather[index],
                                    child: Ui.inspectionTitleText(controller.checkWeather[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.weatherValue.value = value.toString();
                                // '해당없음' 선택 시, 측정치 비활성화
                                if (value == '직접입력') {
                                  controller.textFieldShow.value = true;
                                  controller.textController['weather']?.text = '';
                                } else {
                                  controller.textFieldShow.value = false;
                                  controller.textController['weather']?.text = value.toString();
                                }
                                controller.update();     // GetBuilder 사용으로 인한 update 처리
                              }
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('기온 : ')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['tmpt'],
                            textAlign: TextAlign.right,
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
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('습도 : ')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 70,
                        child: TextField(
                            controller: controller.textController['hmdt'],
                            textAlign: TextAlign.right,
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
                          child: Ui.inspectionTitleText('%')
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('점검자 : ')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 100,
                        child: TextField(
                            controller: controller.textController['chck_nm'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
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
                                  'title' : '점검자'
                                }
                            );
                            if (sign != null) {
                              controller.imageUrl['chck_sign_file_name'] = sign;
                            }
                          }
                        },
                        child: Container(
                            constraints: const BoxConstraints.tightFor(height: 60, width: 70),
                            decoration: Ui.boxDecoration(width: 0.0, borderType: "trb"),
                            child: controller.imageUrl["chck_sign_file_name"] == null
                                ?
                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3))
                                :
                            (controller.imageUrl["chck_sign_file_name"].runtimeType.toString() == "_File"
                                ?
                            Image.file(File(controller.imageUrl["chck_sign_file_name"].path),
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3));
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
                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3));
                              },
                            ))
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Ui.inspectionTitleText('감독자 : ')
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, width: 0.0, borderType: "trb"),
                        height: 60,
                        width: 100,
                        child: TextField(
                            controller: controller.textController['spvs_nm'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
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
                                ?
                            const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3))
                                :
                            (controller.imageUrl["spvs_sign_file_name"].runtimeType.toString() == "_File"
                                ?
                            Image.file(File(controller.imageUrl["spvs_sign_file_name"].path),
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3));
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
                                return const Text('No Sign', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, height: 3.3));
                              },
                            ))
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('설치장소')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "trb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['sub_sttn_nm'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "trb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('급전번호')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "trb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['load_dspt_no'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "trb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('점검자')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "trb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['chck_nm'],
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
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "rlb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('형식')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['hmlg'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('정격')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['rtng'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('감독자')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['spvs_nm'],
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
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "rlb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('제작사')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['prdc_co'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('제작번호')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: TextField(
                            controller: controller.textController['prdc_no'],
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                            ),
                            readOnly: controller.readOnlyYn.value
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Ui.inspectionTitleText('제작년월')
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        alignment: Alignment.center,
                        decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: "rb"),
                        height: 60,
                        width: 150,
                        child: MaterialButton(
                          elevation: 0,
                          padding: const EdgeInsets.all(0),
                          onPressed: () async {
                            Util.print('전 : ${controller.prdcYm.value}');
                            if (controller.readOnlyYn.isFalse) {
                              await Ui.monthPicker(context, controller.prdcYm);
                            }
                            Util.print('후 : ${controller.prdcYm.value}');
                          },
                          child: Obx(() => Ui.inspectionTitleText(controller.prdcYm.value.toString().substring(0, 7))),
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
    } else {
      return const EmptyViewWidget();
    }
  }
}