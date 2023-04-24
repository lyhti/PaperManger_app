import '../controller/SignaturePadController.dart';
import 'package:get/get.dart';

class SignaturePadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignaturePadController>(
          () => SignaturePadController(),
    );
  }
}
