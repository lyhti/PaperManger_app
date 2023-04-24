import 'package:get/get.dart';

import '../controller/cqis_154kv_si_controller.dart';

class Cqis154kVSiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Cqis154kVSiController>(
          () => Cqis154kVSiController(),
    );
  }
}
