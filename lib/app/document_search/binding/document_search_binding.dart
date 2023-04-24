import '../../../model/paging.dart';

import '../controller/DocumentSearchController.dart';

import 'package:get/get.dart';

class DocumentSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentSearchController>(
          () => DocumentSearchController(),
    );
  }
}
