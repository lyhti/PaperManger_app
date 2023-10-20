import 'package:get/get.dart';
import '../controller/work_sft_mtg_risk_asmt_edu_jrnl_1_controller.dart';

class WorkSafetyMeetingRiskAssessmentEducationJournal1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkSafetyMeetingRiskAssessmentEducationJournal1Controller>(
          () => WorkSafetyMeetingRiskAssessmentEducationJournal1Controller(),
    );
  }
}
