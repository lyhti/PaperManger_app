import '../controller/IntroController.dart';

import 'package:get/get.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroController());
  }
}
