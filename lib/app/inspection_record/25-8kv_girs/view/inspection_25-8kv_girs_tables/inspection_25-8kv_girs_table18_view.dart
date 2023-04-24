import '../../../../../common/ui.dart';
import '../../controller/Inspection258kvGirsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inspection258kvGirsTable18ViewWidget extends GetView<Inspection258kvGirsController> {

  Inspection258kvGirsTable18ViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() => Column(
          children: [
            const SizedBox(height: 30),
            Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: Ui.boxDecoration(crud: controller.crud.value),
                alignment: Alignment.center,
                height: 200,
                child: TextField(
                    controller: controller.textController['chck_opin_18'],
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5.0),
                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                    ),
                    minLines: 1,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    readOnly: controller.readOnlyYn.value
                )
            ),
          ],
        )),
      ),
    );
  }
}