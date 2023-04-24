import 'dart:io';

import '../../../common/circular_loading_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/sub_app_bar_widget.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../services/global_service.dart';
import '../../empty_view.dart';
import '../controller/CooctController.dart';
import './cooct_bottom_widget.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CooctViewWidget extends GetView<CooctController> {
  final global = Get.find<GlobalService>();

  CooctViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    return GetBuilder<CooctController>(init: CooctController(), builder: (controller) {
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
              child: SubAppBarWidget(appBar: AppBar(), subTitle: '개폐동작특성시험', tabBar: tabBar)
          ),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: CooctBottomWidget(),       // const 추가 시, GetBuilder 적용 안됨
          body: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4,
            child: SafeArea(
              child: Obx(() => TabBarView(
                controller: controller.tabController,
                physics: const BouncingScrollPhysics(),
                children: List.generate(controller.tabCnt.value, (index) {
                  if (controller.isLoading.isFalse) {
                    return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            decoration: Ui.boxDecoration(),
                                            alignment: Alignment.center,
                                            height: controller.measureDateAreaHeight.toDouble(),
                                            width: 60,
                                            child: const Text('측정일자'),
                                        ),
                                        Container(
                                            decoration: Ui.boxDecoration(borderType: 'rlb'),
                                            alignment: Alignment.center,
                                            height: controller.equipmentNameAreaHeight.toDouble(),
                                            width: 60,
                                            child: const Text('설비명'),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                            alignment: Alignment.center,
                                            height: controller.measureDateAreaHeight.toDouble(),
                                            width: 200,
                                            child: MaterialButton(
                                              elevation: 0,
                                              padding: const EdgeInsets.all(0),
                                              onPressed: () async {
                                                if (controller.readOnlyYn.isFalse) {
                                                  await Ui.datePicker(context, controller.chckYmd);
                                                }
                                              },
                                              child: Obx(() => Text(
                                                controller.chckYmd.value.toString().substring(0, 10),
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),),
                                            ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                                alignment: Alignment.center,
                                                height: controller.measureDateAreaHeight.toDouble(),
                                                width: 80,
                                                child: TextField(
                                                  controller: controller.textController['sub_sttn_nm'],
                                                  focusNode: controller.focusNode['sub_sttn_nm'],
                                                  style: const TextStyle(fontSize: 15),
                                                  decoration: const InputDecoration(contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                                                  readOnly: controller.readOnlyYn.value,
                                                  textAlign: TextAlign.center,
                                                  keyboardType: TextInputType.multiline,
                                                  minLines: 1,
                                                  maxLines: 2,
                                                ),
                                            ),
                                            Container(
                                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                                alignment: Alignment.center,
                                                height: controller.equipmentNameAreaHeight.toDouble(),
                                                width: 40,
                                                child: const Text('SS'),
                                            ),
                                            Container(
                                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                                alignment: Alignment.center,
                                                height: controller.measureDateAreaHeight.toDouble(),
                                                width: 80,
                                                child: TextField(
                                                  controller: controller.textController['eqp_nm'],
                                                  focusNode: controller.focusNode['eqp_nm'],
                                                  style: const TextStyle(fontSize: 15),
                                                  decoration: const InputDecoration(contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                                                  readOnly: controller.readOnlyYn.value,
                                                  textAlign: TextAlign.center,
                                                  keyboardType: TextInputType.multiline,
                                                  minLines: 1,
                                                  maxLines: 2,
                                                ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: Ui.boxDecoration(borderType: 'trb'),
                                          alignment: Alignment.center,
                                          height: controller.measureDateAreaHeight.toDouble() + controller.equipmentNameAreaHeight.toDouble(),
                                          child: Text(controller.textController['sub_title_${index + 1}']!.text, textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                          onTap: controller.crud.value == 'crud-r' ? null : () async {
                                            controller.getCamera("photo_file_nm_${index+1}");
                                          },
                                          child: Column(
                                            children: [
                                              Icon(Icons.camera_alt_outlined, size: 40, color: controller.crud.value == 'crud-r' ? Colors.black26 : Ui.commonColors()),
                                              Text('카메라', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                            ],
                                          )
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: InkWell(
                                          onTap: controller.crud.value == 'crud-r' ? null : () async {
                                            await controller.getGallery("photo_file_nm_${index+1}");
                                          },
                                          child: Column(
                                            children: [
                                              Icon(Icons.photo_outlined, size: 40, color: controller.crud.value == 'crud-r' ? Colors.black26 : Ui.commonColors()),
                                              Text('갤러리', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                            ],
                                          )
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: InkWell(
                                            onTap: controller.crud.value == 'crud-r' ? null : () async {
                                              if (controller.imageUrl["photo_file_nm_${index+1}"] != null) {
                                                Util.confirm('이미지를 삭제 하시겠습니까?', callback: () async {
                                                  await controller.imageUrl.remove("photo_file_nm_${index+1}");
                                                  controller.imageUrl.refresh();
                                                  controller.update();
                                                });
                                              }
                                            },
                                          child: Column(
                                            children: [
                                              Icon(Icons.dangerous_outlined, size: 40, color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.red),
                                              Text('삭    제', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: MediaQuery.of(context).size.height * 0.52,
                                    decoration: BoxDecoration(border: Border.all()),
                                    child: controller.imageUrl["photo_file_nm_${index+1}"].runtimeType == XFile
                                        ?
                                    Image.file(File(controller.imageUrl["photo_file_nm_${index+1}"].path),
                                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                          return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 15));
                                        }
                                    )
                                        :
                                    Image.network((controller.imageUrl["photo_file_nm_${index+1}"] != null ? global.global.value.apiFilePath! + controller.imageUrl["photo_file_nm_${index+1}"] : ""),
                                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                            color: Ui.commonColors(),
                                          ),
                                        );
                                      },
                                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 15));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  } else {
                    return const EmptyViewWidget();
                  }
                }),
              )),
            ),
          ),
        ),
      );
    });
  }
}