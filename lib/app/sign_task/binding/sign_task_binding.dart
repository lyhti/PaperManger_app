import '../../../model/paging.dart';

import '../controller/sign_task_controller.dart';

import 'package:get/get.dart';

class SignTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignTaskController>(
          () => SignTaskController(),
    );
  }
}
