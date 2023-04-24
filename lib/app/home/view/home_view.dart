import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../services/auth_service.dart';
import '../controller/HomeController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewWidget extends GetView<HomeController> {
  GlobalKey<ScaffoldState> bottomSheetKey = GlobalKey();
  final auth = Get.find<AuthService>();

  HomeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    return Scaffold(
      key: bottomSheetKey,
      appBar: MainAppBarWidget(appBar: AppBar(), subTitle: 'Paper Manager'),
      endDrawer: MenuButtonWidget(),
      body: InteractiveViewer(
        panEnabled: true,
        minScale: 1.0,
        maxScale: 4,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 4.0,
                        child: Column(
                          children: [
                            const Text('생성', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)).marginOnly(top: 10, bottom: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Obx(() => DropdownButton2(
                                    isExpanded: true,
                                    hint: Text('문서선택', style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor)),
                                    // getx 오류로 인한 초기 null 처리.
                                    value: controller.selectDocType.value == "" ? null : controller.selectDocType.value,
                                    items: List.generate(auth.docTypeList.length, (index) {
                                      return DropdownMenuItem(
                                        value: auth.docTypeList[index].documentTypeNm,
                                        child: Center(child: Text(auth.docTypeList[index].documentTypeNm.toString()))
                                      );
                                    }),
                                    onChanged: (value) {
                                      controller.selectDocType.value = value.toString();
                                    },
                                    alignment: Alignment.center,
                                    itemHeight: 50,
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      // border: Border.all(
                                      //   color: Colors.black12,
                                      // )
                                    ),
                                    scrollbarAlwaysShow: true,
                                    buttonHeight: 70,
                                    // buttonWidth: 200,
                                    dropdownMaxHeight: 300,
                                    searchController: controller.docTypeTextController,
                                    searchInnerWidget: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        controller: controller.docTypeTextController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          hintText: 'Search for an item...',
                                          hintStyle: const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    searchMatchFn: (item, searchValue) {
                                      return (item.value.toString().contains(searchValue));
                                    },
                                    //This to clear the search value when you close the menu
                                    onMenuStateChange: (isOpen) {
                                      if (!isOpen) {
                                        controller.docTypeTextController.clear();
                                      }
                                    },
                                  )),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () async {
                                if (controller.selectDocType.value == '' || controller.selectDocType.value == '문서선택') {
                                  Util.alert('문서를 선택해주세요.');
                                } else {
                                  for (var element in auth.docTypeList) {
                                    if (element.documentTypeNm == controller.selectDocType.value) {
                                      Util.print('문서 타입 : ${element.codeAbbreviation}');

                                      /** login token check */
                                      String check = await Util.tokenChk();

                                      if (check == 'agree') {
                                        Get.toNamed('/${element.codeAbbreviation}',
                                            arguments: {
                                              'crud' : 'crud-c',
                                              'doc_type' : element.codeAbbreviation
                                            });
                                      }
                                    }
                                  }
                                }
                              },
                              icon: const Icon(Icons.create_sharp),
                              color: Ui.commonColors(),
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 4.0,
                        child: Column(
                          children: [
                            const Text('조회', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    /** login token check */
                                    String check = await Util.tokenChk();

                                    if (check == 'agree') {
                                      Get.toNamed('/docList');
                                    }
                                  },
                                  icon: const Icon(Icons.search),
                                  color: Ui.commonColors(),
                                  iconSize: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}