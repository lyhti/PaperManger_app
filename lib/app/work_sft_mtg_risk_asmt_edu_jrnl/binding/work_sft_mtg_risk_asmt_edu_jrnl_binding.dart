import 'package:get/get.dart';
import '../controller/work_sft_mtg_risk_asmt_edu_jrnl_controller.dart';

class WorkSafetyMeetingRiskAssessmentEducationJournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkSafetyMeetingRiskAssessmentEducationJournalController>(
          () => WorkSafetyMeetingRiskAssessmentEducationJournalController(),
    );
  }
}
