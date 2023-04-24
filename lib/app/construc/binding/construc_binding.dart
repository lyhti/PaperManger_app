import '../controller/ConstrucController.dart';

import 'package:get/get.dart';

class ConstrucBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConstrucController>(
          () => ConstrucController(),
    );
  }
}
