import '../controller/Inspection258kvGirsController.dart';
import 'package:get/get.dart';

class Inspection258kvGirsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Inspection258kvGirsController>(
          () => Inspection258kvGirsController(),
    );
  }
}
