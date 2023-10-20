import '../app/cqis_154kv_si/binding/cqis_154kv_si_binding.dart';
import '../app/daily_work_rpt/binding/daily_work_report_binding.dart';
import '../app/daily_work_rpt/view/daily_work_report.dart';
import '../app/hvy_mtrl_hndl_work_plan/binding/hvy_mtrl_hndl_work_plan_binding.dart';
import '../app/hvy_mtrl_hndl_work_plan/view/hvy_mtrl_hndl_work_plan_view.dart';
import '../app/pre_work_conf/view/pre_work_conf_view.dart';

import '../app/cooct/view/cooct_view.dart';
import '../app/ct_scrmrs/binding/ct_scrmrs_binding.dart';
import '../app/ct_scrmrs/view/ct_scrmrs_view.dart';
import '../app/rsk_asmt_pwrt_ovhd_srvy/binding/rsk_asmt_pwrt_ovhd_srvy_binding.dart';
import '../app/rsk_asmt_pwrt_ovhd_srvy/view/rsk_asmt_pwrt_ovhd_srvy_view.dart';
import '../app/sign_task/binding/sign_task_binding.dart';
import '../app/sign_task/view/sign_task_view.dart';
import '../app/sign_task_search/binding/sign_task_search_binding.dart';
import '../app/sign_task_search/view/sign_task_search_view.dart';
import '../app/signature_pad/view/signature_pad_widget.dart';
import '../app/construc/view/construc_view.dart';
import '../app/construc/binding/construc_binding.dart';
import '../app/cooct/binding/cooct_binding.dart';
import '../app/document_search/binding/document_search_binding.dart';
import '../app/document_search/view/document_search_view.dart';
import '../app/inspection_record/25-8kv_girs/binding/inspection_25-8kv_girs_binding.dart';
import '../app/inspection_record/25-8kv_girs/view/inspection_25-8kv_girs_view.dart';
import '../app/intro/binding/intro_binding.dart';
import '../app/intro/view/intro_view.dart';
import '../app/auth/binding/login_binding.dart';
import '../app/auth/view/login_view.dart';
import '../app/home/binding/home_binding.dart';
import '../app/home/view/home_view.dart';
import '../app/cqis_154kv_si/view/cqis_154kv_si_view.dart';

import 'package:get/get.dart';

import '../app/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc/binding/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc_binding.dart';
import '../app/work_sft_chck_list_s17_stel_strc_asmb_bsbr_wrng_construc/view/work_safety_check_list_s17_steel_structure_assembly_busbar_wiring_construction_view.dart';
import '../app/work_sft_mtg_risk_asmt_edu_jrnl/view/work_sft_mtg_risk_asmt_edu_jrnl_view.dart';
import '../app/work_sft_mtg_risk_asmt_edu_jrnl_1/view/work_sft_mtg_risk_asmt_edu_jrnl_1_view.dart';
import '../app/work_sft_mtg_risk_asmt_edu_jrnl_2/view/work_sft_mtg_risk_asmt_edu_jrnl_2_view.dart';

class AppRoute {
  static final routes = [
    GetPage(name: '/intro', page: () => IntroView(), binding: IntroBinding()),                                          // 인트로
    GetPage(name: '/login', page: () => LoginViewWidget(), binding: LoginBinding()),                                    // 로그인
    GetPage(name: '/home', page: () => HomeViewWidget(), binding: HomeBinding()),                                       // 홈 화면
    GetPage(name: '/docList', page: () => DocumentSearchView(), binding: DocumentSearchBinding()),                      // 문서 조회 화면

    GetPage(name: '/signTaskList', page: () => SignTaskSearchView(), binding: SignTaskSearchBinding()),                      // 문서 조회 화면
    GetPage(name: '/signTask', page: () => SignTaskView(), binding: SignTaskBinding()),                      // 문서 조회 화면

    GetPage(name: '/construc', page: () => ConstrucViewWidget(), binding: ConstrucBinding()),                           // 시공사진 문서 조회 화면
    GetPage(name: '/cooct', page: () => CooctViewWidget(), binding: CooctBinding()),                                    // 개폐동작특성시험 문서 조회 화면
    GetPage(name: '/25-8kv_girs', page: () => Inspection258kvGirsViewWidget(), binding: Inspection258kvGirsBinding()),  // 점검기록표(25.8kv)
    GetPage(name: '/ct_scrmrs', page: () => CtScrmrsViewWidget(), binding: CtScrmrsBinding()),                          // CT 2차회로 저항 측정 기록표
    GetPage(name: '/signature_page', page: () => SignaturePadWidget()),                                                 // signPad
    GetPage(name: '/cqis_154kv_si', page: () => Cqis154kvSiViewWidget(), binding: Cqis154kVSiBinding()),                // 154kV Sh.C 설치(철거)
    GetPage(name: '/daily_work_rpt', page: () => DailyWorkReportViewWidget(), binding: DailyWorkReportBinding()),                                          // 작업일보
    // GetPage(name: '/pre_work_safety_conf', page: () => PreWorkConferenceViewWidget()),                                  // 작업전안전회의
    GetPage(name: '/work_sft_mtg_risk_asmt_edu_jrnl', page: () => WorkSafetyMeetingRiskAssessmentEducationJournalViewWidget()),                                  // 작업전안전회의
    GetPage(name: '/work_sft_mtg_risk_asmt_edu_jrnl_1', page: () => WorkSafetyMeetingRiskAssessmentEducationJournal1ViewWidget()),                                  // 작업전안전회의_1
    GetPage(name: '/work_sft_mtg_risk_asmt_edu_jrnl_2', page: () => WorkSafetyMeetingRiskAssessmentEducationJournal2ViewWidget()),                                  // 작업전안전회의_1

    GetPage(name: '/work_sft_chck_list_s17', page: () => WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionViewWidget(), binding: WorkSafetyCheckListS17SteelStructureAssemblyBusbarWiringConstructionBinding()),                                  // 작업안전 체크리스트(S17 철구 조립 및 모선배선공사)
    GetPage(name: '/hvy_mtrl_hndl_work_plan', page: () => HeavyMaterialHandlingWorkPlanViewWidget(), binding: HeavyMaterialHandlingWorkPlanBinding()),  // 중량물 취급 작업계획서
    GetPage(name: '/rsk_asmt_pwrt_ovhd_srvy', page: () => RskAsmtPwrtOvhdSrvyViewWidget(), binding: RskAsmtPwrtOvhdSrvyBinding()),  // 위험성평가 표준안(송전/가공)-측량
  ];
}