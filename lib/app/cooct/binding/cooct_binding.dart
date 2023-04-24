import '../controller/CooctController.dart';
import 'package:get/get.dart';

class CooctBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CooctController>(
          () => CooctController(),
    );
  }
}
