import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/menu_button_widget.dart';
import '../../../../common/sub_app_bar_widget.dart';
import '../../../../common/ui.dart';
import '../../../../common/util.dart';
import '../../../../services/global_service.dart';
import '../controller/Inspection258kvGirsController.dart';
import './inspection_25-8kv_girs_bottom_widget.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table00_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table01_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table02_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table03_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table04_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table05_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table06_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table07_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table08_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table09_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table10_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table11_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table12_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table13_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table14_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table15_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table16_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table17_view.dart';
import './inspection_25-8kv_girs_tables/inspection_25-8kv_girs_table18_view.dart';

class Inspection258kvGirsViewWidget extends GetView<Inspection258kvGirsController> {
  final global = Get.find<GlobalService>();

  Inspection258kvGirsViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    return GetBuilder<Inspection258kvGirsController>(init: Inspection258kvGirsController(), builder: (controller) {
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

      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(112.0),
              child: SubAppBarWidget(appBar: AppBar(), subTitle: '25-8kV GIS(보통_정밀)\n점검기록표', tabBar: tabBar)
          ),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: Inspection258kvGirsBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
          body: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4,
            child: TabBarView(
                controller: controller.tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Inspection258kvGirsTable00ViewWidget(),
                  Inspection258kvGirsTable01ViewWidget(),
                  Inspection258kvGirsTable02ViewWidget(),
                  Inspection258kvGirsTable03ViewWidget(),
                  Inspection258kvGirsTable04ViewWidget(),
                  Inspection258kvGirsTable05ViewWidget(),
                  Inspection258kvGirsTable06ViewWidget(),
                  Inspection258kvGirsTable07ViewWidget(),
                  Inspection258kvGirsTable08ViewWidget(),
                  Inspection258kvGirsTable09ViewWidget(),
                  Inspection258kvGirsTable10ViewWidget(),
                  Inspection258kvGirsTable11ViewWidget(),
                  Inspection258kvGirsTable12ViewWidget(),
                  Inspection258kvGirsTable13ViewWidget(),
                  Inspection258kvGirsTable14ViewWidget(),
                  Inspection258kvGirsTable15ViewWidget(),
                  Inspection258kvGirsTable16ViewWidget(),
                  Inspection258kvGirsTable17ViewWidget(),
                  Inspection258kvGirsTable18ViewWidget(),
                ]
            ),
          ),
        ),
      );
    });
  }
}