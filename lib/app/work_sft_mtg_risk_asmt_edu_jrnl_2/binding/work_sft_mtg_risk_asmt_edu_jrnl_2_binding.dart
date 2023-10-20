import 'package:get/get.dart';
import '../controller/work_sft_mtg_risk_asmt_edu_jrnl_2_controller.dart';

class WorkSafetyMeetingRiskAssessmentEducationJournal2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkSafetyMeetingRiskAssessmentEducationJournal2Controller>(
          () => WorkSafetyMeetingRiskAssessmentEducationJournal2Controller(),
    );
  }
}
