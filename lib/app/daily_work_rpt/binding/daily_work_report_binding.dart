import 'package:get/get.dart';

import '../controller/daily_work_report_controller.dart';

class DailyWorkReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyWorkReportController>(
          () => DailyWorkReportController(),
    );
  }
}
