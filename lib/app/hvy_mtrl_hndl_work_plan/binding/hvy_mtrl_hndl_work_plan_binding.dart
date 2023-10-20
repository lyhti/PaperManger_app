import 'package:get/get.dart';

import '../controller/hvy_mtrl_hndl_work_plan_controller.dart';

class HeavyMaterialHandlingWorkPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeavyMaterialHandlingWorkPlanController>(
          () => HeavyMaterialHandlingWorkPlanController(),
    );
  }
}
