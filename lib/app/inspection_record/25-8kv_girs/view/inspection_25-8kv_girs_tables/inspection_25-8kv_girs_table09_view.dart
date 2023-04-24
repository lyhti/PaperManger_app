import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable09ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable09ViewWidget({Key? key}) : super(key: key);

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
                        width: 150,
                        child: Ui.inspectionTitleText('점검내용')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 250,
                        child: Ui.inspectionTitleText('기    준')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Ui.inspectionTitleText('결  과')
                    ),
                    Container(
                        decoration: Ui.boxDecoration(borderType: 'trb'),
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        child: Ui.inspectionTitleText('비    고')
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('점검창 및 각 부분'),
                            Ui.inspectionTitleText('(비닐로 밀봉한다)')
                          ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: Ui.boxDecoration(borderType: 'rb'),
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ui.inspectionTitleText('년 1% 이하'),
                            Ui.inspectionTitleText('(24시간 이상 경과 후'),
                            Ui.inspectionTitleText('Check: 5PPMv 이하일것)')
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
                              value: controller.textController['chck_rslt_9']!.text.isEmpty ? null : controller.textController['chck_rslt_9']?.text,
                              items: List.generate(controller.checkResultList.length, (index) {
                                return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: controller.checkResultList[index],
                                    child: Ui.inspectionTitleText(controller.checkResultList[index])
                                );
                              }),
                              onChanged: controller.readOnlyYn.isTrue ? null : (value) {
                                controller.textController['chck_rslt_9']?.text = value.toString();
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
                            controller: controller.textController['rmrk_9'],
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