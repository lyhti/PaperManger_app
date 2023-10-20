import 'package:get/get.dart';

import '../controller/rsk_asmt_pwrt_ovhd_srvy_controller.dart';

class RskAsmtPwrtOvhdSrvyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RskAsmtPwrtOvhdSrvyController>(
          () => RskAsmtPwrtOvhdSrvyController(),
    );
  }
}
