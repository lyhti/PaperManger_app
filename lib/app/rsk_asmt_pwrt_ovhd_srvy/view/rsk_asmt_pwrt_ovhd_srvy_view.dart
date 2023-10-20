import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/menu_button_widget.dart';
import '../../../../common/sub_app_bar_widget.dart';
import '../../../../common/ui.dart';
import '../../../../common/util.dart';
import '../../../../services/global_service.dart';

import '../../../common/circular_loading_widget.dart';
import '../controller/rsk_asmt_pwrt_ovhd_srvy_controller.dart';
import 'rsk_asmt_pwrt_ovhd_srvy_bottom_widget.dart';
import 'rsk_asmt_pwrt_ovhd_srvy_tables/rsk_asmt_pwrt_ovhd_srvy_table01_view.dart';
import 'rsk_asmt_pwrt_ovhd_srvy_tables/rsk_asmt_pwrt_ovhd_srvy_table02_view.dart';
import 'rsk_asmt_pwrt_ovhd_srvy_tables/rsk_asmt_pwrt_ovhd_srvy_table03_view.dart';

class RskAsmtPwrtOvhdSrvyViewWidget extends GetView<RskAsmtPwrtOvhdSrvyController> {
  final global = Get.find<GlobalService>();

  RskAsmtPwrtOvhdSrvyViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    return GetBuilder<RskAsmtPwrtOvhdSrvyController>(init: RskAsmtPwrtOvhdSrvyController(), builder: (controller) {
      // 텝바 선언 시작
      TabBar tabBar = TabBar(
        controller: controller.tabController,
        // 선택되지 않은 Tab 의 label 색상
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            // 선택된 Tab 의 label 색상
            color: Ui.commonColors()
        ),
        isScrollable: true,
        physics: const BouncingScrollPhysics(),
        tabs: controller.tabs,
      );
      // 텝바 선언 종료

      if(controller.isInitialized.value == false) {
        return const CircularLoadingWidget(height: 70);
      }

      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(112.0),
              child: SubAppBarWidget(appBar: AppBar(), subTitle: '위험성평가 표준안(송전/가공)-측량', tabBar: tabBar)
          ),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: RskAsmtPwrtOvhdSrvyBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
          body: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4,
            child: TabBarView(
                controller: controller.tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  RskAsmtPwrtOvhdSrvyTable01ViewWidget(),
                  RskAsmtPwrtOvhdSrvyTable02ViewWidget(),
                  RskAsmtPwrtOvhdSrvyTable03ViewWidget(),
                ]
            ),
          ),
        ),
      );
    });
  }
}