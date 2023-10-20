import '../../../model/paging.dart';

import '../controller/sign_task_search_controller.dart';

import 'package:get/get.dart';

class SignTaskSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignTaskSearchController>(
          () => SignTaskSearchController(),
    );
  }
}
