import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/menu_button_widget.dart';
import '../../../services/global_service.dart';
import '../../../common/circular_loading_widget.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../empty_view.dart';
import '../controller/ConstrucController.dart';
import '../../../common/sub_app_bar_widget.dart';
import './construc_bottom_widget.dart';

class ConstrucViewWidget extends GetView<ConstrucController> {
  final global = Get.find<GlobalService>();

  ConstrucViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    var screenWidth = MediaQuery.of(context).size.width;
    var areaWidth = screenWidth / 2 - controller.paddingValue.value * 2;
    var areaHeight = areaWidth * controller.photoAspectRatio.value + controller.buttonAreaHeight.value + controller.titleAreaHeight.value + controller.safeAreaHeight.value;

    /** TabBar Obx 사용불가로 인한 GetBuilder 사용 */
    return GetBuilder<ConstrucController>(builder: (controller) {
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
            child: SubAppBarWidget(appBar: AppBar(), subTitle: '시공사진', tabBar: tabBar),
          ),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: ConstrucBottomWidget(),       // const 추가 시, GetBuilder 적용 안됨
          body: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4,
            child: SafeArea(
              child: Obx(() => TabBarView(
                controller: controller.tabController,
                physics: const BouncingScrollPhysics(),
                children: List.generate(controller.tabCnt.value, (index1) {
                  if (controller.isLoading.isFalse) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        if (controller.crud.value == 'crud-r') {
                          controller.onRefresh();
                          controller.tabController!.index = 0;
                          controller.update();      // GetBuilder 사용으로 인한 update 처리
                        } else {
                          Util.confirm('작성 중인 내용이 사라집니다.\n새로고침 하시겠습니까?', callback: () async {
                            controller.onRefresh();
                            controller.tabController!.index = 0;
                            controller.update();      // GetBuilder 사용으로 인한 update 처리
                          });
                        }
                      },
                      child: SingleChildScrollView(
                        controller: controller.scrollController,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(border: Border.all()),
                                  child: const Text('점검일자'),
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                    height: 40,
                                    width: 100,
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
                                        style: const TextStyle(fontSize: 15),
                                      ),),
                                    ),
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'trb'),
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 80,
                                    child: const Text('변전소')
                                ),
                                Expanded(
                                  child: Container(
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      child: TextField(
                                        controller: controller.textController['sub_sttn_nm'],
                                        focusNode: controller.focusNode['sub_sttn_nm'],
                                        style: const TextStyle(
                                            fontSize: 15
                                        ),
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                        ),
                                        readOnly: controller.readOnlyYn.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: 2,
                                      )
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    height: 40,
                                    width: 80,
                                    alignment: Alignment.center,
                                    child: const Text('기기명'),
                                ),
                                Expanded(
                                  child: Container(
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      child: TextField(
                                        controller: controller.textController['eqp_nm'],
                                        focusNode: controller.focusNode['eqp_nm'],
                                        style: const TextStyle(
                                            fontSize: 15
                                        ),
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                        ),
                                        readOnly: controller.readOnlyYn.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.multiline,
                                        minLines: 1,
                                        maxLines: 2,
                                      )
                                  ),
                                ),
                              ],
                            ),
                            Obx(() => GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.gridCellNumber.value,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: areaWidth / areaHeight,
                              ),
                              itemBuilder: (BuildContext context, int index2) {
                                return Container(
                                  decoration: Ui.boxDecoration(borderType: 'rb'),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          height: areaWidth * 1.2,
                                          width: areaWidth,
                                          decoration: BoxDecoration(border: Border.all()),
                                          child:
                                          controller.imageUrl["photo_file_nm_${index1+1}-${index2+1}"].runtimeType == XFile
                                              ?
                                          Image.file(File(controller.imageUrl["photo_file_nm_${index1+1}-${index2+1}"].path),
                                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                              return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 8));
                                            }
                                          )
                                              :
                                          Image.network((controller.imageUrl["photo_file_nm_${index1+1}-${index2+1}"] != null ? global.global.value.apiFilePath! + controller.imageUrl["photo_file_nm_${index1+1}-${index2+1}"] : ""),
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
                                              return const Text('No Image', textAlign: TextAlign.center, style: TextStyle(height: 8));
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: controller.crud.value == 'crud-r' ? null : () async {
                                                await controller.getCamera("photo_file_nm_${index1+1}-${index2+1}");
                                              },
                                              child: Column(
                                                children: [
                                                  Icon(Icons.camera_alt_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Ui.commonColors()),
                                                  Text('카메라', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                                ],
                                              )
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 15),
                                            child: InkWell(
                                                onTap: controller.crud.value == 'crud-r' ? null : () async {
                                                  await controller.getGallery("photo_file_nm_${index1+1}-${index2+1}");
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(Icons.photo_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Ui.commonColors()),
                                                    Text('갤러리', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                                  ],
                                                )
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 15),
                                            child: InkWell(
                                                onTap: controller.crud.value == 'crud-r' ? null : () async {
                                                  if (controller.imageUrl["photo_file_nm_${index1+1}-${index2+1}"] != null) {
                                                    Util.confirm('이미지를 삭제 하시겠습니까?', callback: () async {
                                                      await controller.imageUrl.remove("photo_file_nm_${index1+1}-${index2+1}");
                                                      controller.imageUrl.refresh();
                                                      controller.update();
                                                    });
                                                  }
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(Icons.dangerous_outlined, size: 34, color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.red),
                                                    Text('삭    제', style: TextStyle(color: controller.crud.value == 'crud-r' ? Colors.black26 : Colors.black))
                                                  ],
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(color: Ui.colors(controller.crud.value)),
                                                  height: 40,
                                                  child: TextField(
                                                    controller: controller.textController['sub_title_${(index1 + 1)}-${(index2 + 1)}'],
                                                    style: const TextStyle(
                                                        fontSize: 15
                                                    ),
                                                    decoration: const InputDecoration(
                                                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                                    ),
                                                    readOnly: controller.readOnlyYn.value,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.multiline,
                                                    minLines: 1,
                                                    maxLines: 2
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const EmptyViewWidget();
                  }
                }
                ),
              )),
            ),
          ),
        ),
      );
    }) ;
  }
}