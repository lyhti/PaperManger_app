import '../controller/CtScrmrsController.dart';
import 'package:get/get.dart';

class CtScrmrsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CtScrmrsController>(
          () => CtScrmrsController(),
    );
  }
}
