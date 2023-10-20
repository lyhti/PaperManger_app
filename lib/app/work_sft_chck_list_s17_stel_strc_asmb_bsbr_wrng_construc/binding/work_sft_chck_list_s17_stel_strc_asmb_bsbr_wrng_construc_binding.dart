import 'package:get/get.dart';

import '../controller/work_safety_check_list_s17_steel_structure_assembly_busbar_wiring_construction_controller.dart';

class WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionController>(
          () => WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionController(),
    );
  }
}
