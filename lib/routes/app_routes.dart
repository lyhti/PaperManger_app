import '../app/cqis_154kv_si/binding/cqis_154kv_si_binding.dart';
import '../app/daily_work_rpt/binding/daily_work_report_binding.dart';
import '../app/daily_work_rpt/view/daily_work_report.dart';
import '../app/pre_work_conf/view/pre_work_conf_view.dart';

import '../app/cooct/view/cooct_view.dart';
import '../app/ct_scrmrs/binding/ct_scrmrs_binding.dart';
import '../app/ct_scrmrs/view/ct_scrmrs_view.dart';
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

class AppRoute {
  static final routes = [
    GetPage(name: '/intro', page: () => IntroView(), binding: IntroBinding()),                                          // 인트로
    GetPage(name: '/login', page: () => LoginViewWidget(), binding: LoginBinding()),                                    // 로그인
    GetPage(name: '/home', page: () => HomeViewWidget(), binding: HomeBinding()),                                       // 홈 화면
    GetPage(name: '/docList', page: () => DocumentSearchView(), binding: DocumentSearchBinding()),                      // 문서 조회 화면
    GetPage(name: '/construc', page: () => ConstrucViewWidget(), binding: ConstrucBinding()),                           // 시공사진 문서 조회 화면
    GetPage(name: '/cooct', page: () => CooctViewWidget(), binding: CooctBinding()),                                    // 개폐동작특성시험 문서 조회 화면
    GetPage(name: '/25-8kv_girs', page: () => Inspection258kvGirsViewWidget(), binding: Inspection258kvGirsBinding()),  // 점검기록표(25.8kv)
    GetPage(name: '/ct_scrmrs', page: () => CtScrmrsViewWidget(), binding: CtScrmrsBinding()),                          // CT 2차회로 저항 측정 기록표
    GetPage(name: '/signature_page', page: () => SignaturePadWidget()),                                                 // signPad
    GetPage(name: '/cqis_154kv_si', page: () => Cqis154kvSiViewWidget(), binding: Cqis154kVSiBinding()),                // 154kV Sh.C 설치(철거)
    GetPage(name: '/daily_work_rpt', page: () => DailyWorkReportViewWidget(), binding: DailyWorkReportBinding()),                                          // 작업일보
    GetPage(name: '/pre_work_safety_conf', page: () => PreWorkConferenceViewWidget()),                                  // 작업전안전회의
  ];
}