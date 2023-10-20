import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../common/circular_loading_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/sub_app_bar_widget.dart';
import '../../../common/util.dart';
import '../../../common/ui.dart';
import '../../../common/log.dart';
import '../../../services/auth_service.dart';
import '../controller/sign_task_search_controller.dart';

import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class SignTaskSearchView extends GetView<SignTaskSearchController> {
  final auth = Get.find<AuthService>();

  SignTaskSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {FocusScope.of(context).unfocus();},
      child: Scaffold(
        appBar: SubAppBarWidget(appBar: AppBar(), subTitle: '사인 요청 조회'),
        endDrawer: MenuButtonWidget(),
        body: SingleChildScrollView(
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4,
            child: SafeArea(
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    // 캘린더 설정
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 시작일자
                        MaterialButton(
                          height: 40,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xffd6d6d6),
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Colors.white,
                          onPressed: () async {
                            await Ui.datePicker(context, controller.startDate);
                            if (controller.endDate.value.difference(controller.startDate.value).isNegative) {
                              await Util.neverSatisfied(Get.context!, "시작일자가 종료일자를 넘을 수 없습니다.");
                              controller.startDate.value = controller.endDate.value;
                            }

                            if (controller.endDate.value.difference(controller.startDate.value).inDays > 30) {
                              await Util.neverSatisfied(Get.context!, "검색 기한은 최대 30일 입니다.");
                              controller.startDate.value = controller.startDate.value.add(Duration(days: (controller.endDate.value.difference(controller.startDate.value).inDays-30)));
                            }
                          },
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.startDate.value.toString().substring(0, 10),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Image.asset(
                                'assets/icon/ico_1_calendar_btn.png',
                                width: 32,
                                height: 32,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Text('~'),
                        ),
                        // 종료일자
                        MaterialButton(
                          height: 40,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xffd6d6d6),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Colors.white,
                          onPressed: () async {
                            await Ui.datePicker(context, controller.endDate);
                            if (controller.endDate.value.difference(controller.startDate.value).isNegative) {
                              await Util.neverSatisfied(Get.context!, "시작일자가 종료일자를 넘을 수 없습니다.");
                              controller.endDate.value = controller.startDate.value;
                            }

                            if (controller.endDate.value.difference(controller.startDate.value).inDays > 30) {
                              await Util.neverSatisfied(Get.context!, "검색 기한은 최대 30일 입니다.");
                              controller.endDate.value = controller.endDate.value.add(Duration(days: -(controller.endDate.value.difference(controller.startDate.value).inDays-30)));
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.endDate.value.toString().substring(0, 10),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,

                                ),
                              ),
                              Image.asset(
                                'assets/icon/ico_1_calendar_btn.png',
                                width: 32,
                                height: 32,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /**
                   * Wayble dropdown
                   * */
                  // Obx(() {
                  //   return Util.dropdownButton<DocumentType>(controller.selectDocType,
                  //       (List.generate(
                  //           auth.docTypeList.length, (index) {
                  //         return DropdownMenuItem<DocumentType>(
                  //           value: auth.docTypeList[index],
                  //           child: Text(auth.docTypeList[index].documentTypeNm),
                  //         );
                  //       })), (DocumentType value) {
                  //         controller.selectDocType.value = value.documentTypeNm;
                  //       });
                  // }),
                  /**
                   * 검색 기능 추가 dropdown
                   * */
                  // Obx(() => Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: DropdownButton2(
                  //       isExpanded: true,
                  //       hint: Text(
                  //         '전체문서',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Theme.of(context).hintColor,
                  //         ),
                  //       ),
                  //       items: List.generate(auth.docTypeList.length, (index) {
                  //         return DropdownMenuItem(
                  //           value: auth.docTypeList[index].documentTypeNm,
                  //           child: Text(auth.docTypeList[index].documentTypeNm),
                  //         );
                  //       }),
                  //       value: controller.selectDocType.value == "" ? null : controller.selectDocType.value,
                  //       onChanged: (value) {
                  //         controller.selectDocType.value = value.toString();
                  //       },
                  //       buttonHeight: 40,
                  //       buttonWidth: 200,
                  //       itemHeight: 40,
                  //       dropdownMaxHeight: 200,
                  //       searchController: controller.docTypeTextController,
                  //       searchInnerWidget: Padding(
                  //         padding: const EdgeInsets.only(
                  //           top: 8,
                  //           bottom: 4,
                  //           right: 8,
                  //           left: 8,
                  //         ),
                  //         child: TextFormField(
                  //           controller: controller.docTypeTextController,
                  //           decoration: InputDecoration(
                  //             isDense: true,
                  //             contentPadding: const EdgeInsets.symmetric(
                  //               horizontal: 10,
                  //               vertical: 8,
                  //             ),
                  //             hintText: 'Search for an item...',
                  //             hintStyle: const TextStyle(fontSize: 12),
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       searchMatchFn: (item, searchValue) {
                  //         return (item.value.toString().contains(searchValue));
                  //       },
                  //       //This to clear the search value when you close the menu
                  //       onMenuStateChange: (isOpen) {
                  //         if (!isOpen) {
                  //           controller.docTypeTextController.clear();
                  //         }
                  //       },
                  //     ),
                  // )),
                  // /**
                  //  * 일반 dropdown
                  //  * */
                  // Obx(() => Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: DropdownButton(
                  //       hint: const Text("문서전체"),
                  //       // getx 오류로 인한 초기 null 처리.
                  //       value: controller.selectDocType.value == "" ? null : controller.selectDocType.value,
                  //       items: List.generate(controller.docTypeList.length, (index) {
                  //         return DropdownMenuItem(
                  //           value: controller.docTypeList[index],
                  //           child: Text(controller.docTypeList[index]),
                  //         );
                  //       }),
                  //       onChanged: (value) {
                  //         controller.selectDocType.value = value.toString();
                  //         controller.selectDocPaginate.value = '';
                  //       })
                  // )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text('문서전체',
                          style: TextStyle(fontSize: 15, color: Theme.of(context).hintColor)
                      ),
                      // getx 오류로 인한 초기 null 처리.
                      value: controller.selectDocType.value == "" ? null : controller.selectDocType.value,
                      items: List.generate(controller.docTypeList.length, (index) {
                        return DropdownMenuItem(
                          value: controller.docTypeList[index],
                          child: Text(controller.docTypeList[index].toString(), style: const TextStyle(fontSize: 15)),
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
                      buttonHeight: 50,
                      buttonWidth: 250,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: TextField(
                        controller: controller.textEditingController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          controller.searchWord.value = value.toString();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            /** login token check */
                            String check = await Util.tokenChk();

                            if (check == 'agree') {
                              controller.selectDocPaginate.value = '';
                              await controller.onRefresh();
                            }
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Ui.commonColors())),
                          child: const Text('조회'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: controller.tableHeight.value,
                    child: ScrollableTableView(
                      // paginationController: null,
                      columns: const [
                        TableViewColumn(width: 70, label: '번호'),
                        TableViewColumn(width: 150, label: '문서종류'),
                        TableViewColumn(width: 200, label: '문서제목'),
                        TableViewColumn(width: 80, label: '작성/수정자'),
                        TableViewColumn(width: 100, label: '작성/수정일시')
                      ],
                      rows: List.generate((controller.signTaskList.isEmpty ? 1 : controller.signTaskList.length), (index) {
                        if (controller.isLoading.value) {
                          return TableViewRow(
                            height: controller.tableViewLowHeight.value,
                            cells: const [
                              TableViewCell(child: CircularLoadingWidget(height: 70))
                            ],
                          );
                        } else {
                          if (controller.signTaskList.isEmpty) {
                            return const TableViewRow(
                              height: 200,
                              cells: [
                                TableViewCell(child: Text('조회 된\n내용이\n없습니다', textAlign: TextAlign.center))
                              ],
                            );
                          } else {
                            logger.d(controller.signTaskList[index]);
                            return TableViewRow(
                                height: 40,
                                onTap: () async {
                                  /** login token check */
                                  String check = await Util.tokenChk();

                                  if (check == 'agree') {
                                    Get.toNamed(
                                      'signTask', 
                                      arguments: {
                                        'documentSn' : controller.signTaskList[index].documentSn,
                                        'taskSn' : controller.signTaskList[index].taskSn,
                                        'documentTypeNm' : controller.signTaskList[index].documentTypeNm.toString(),
                                        'cstrnNm' : controller.signTaskList[index].cstrnNm.toString(),
                                        'taskDesc' : controller.signTaskList[index].taskDesc.toString(),
                                        'userNm' : controller.signTaskList[index].userNm.toString(),
                                        'confirmed' : controller.signTaskList[index].confirmed,
                                        'taskStatus' : controller.signTaskList[index].taskStatus,
                                        'signVarName' : controller.signTaskList[index].signVarName.toString(),
                                      }
                                    );
                                  }
                                },
                                cells: [
                                  TableViewCell(child: Text((controller.docPaging.value.total! - ((controller.docPaging.value.perPage! * (controller.docPaging.value.currentPage!-1))+index)).toString())),
                                  TableViewCell(child: Text(controller.signTaskList[index].documentTypeNm.toString())),
                                  TableViewCell(child: Text(controller.signTaskList[index].title.toString())),
                                  TableViewCell(child: Text(controller.signTaskList[index].userNm.toString())),
                                  TableViewCell(child: Text(DateFormat('yyyy-MM-dd').format(controller.signTaskList[index].crtDt!))),
                                ]
                            );
                          }
                        }
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text('${controller.docPaging.value.from}-${controller.docPaging.value.to} / ${controller.docPaging.value.total}'),
                          IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              iconSize: 20,
                              onPressed: () async {
                                if (controller.currentPage.value > 1) {
                                  /** login token check */
                                  String check = await Util.tokenChk();

                                  if (check == 'agree') {
                                    controller.currentPage.value -= 1;
                                    await controller.getSignTaskList();
                                  }
                                } else {
                                  Get.showSnackbar(Ui.defaultSnackBar(message: '첫 페이지입니다.'));
                                }
                              }
                          ),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                              onPressed: () async {
                                if (controller.currentPage.value < controller.docPaging.value.lastPage!) {
                                  /** login token check */
                                  String check = await Util.tokenChk();

                                  if (check == 'agree') {
                                    controller.currentPage.value += 1;
                                    await controller.getSignTaskList();
                                  }
                                } else {
                                  Get.showSnackbar(Ui.defaultSnackBar(message: '마지막 페이지입니다.'));
                                }
                              }
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButton(
                              hint: const Text("10개"),
                              // getx 오류로 인한 초기 null 처리.
                              value: controller.selectDocPaginate.value == "" ? null : controller.selectDocPaginate.value,
                              items: List.generate(controller.docPaginate.length, (index) {
                                return DropdownMenuItem(
                                  value: controller.docPaginate[index].toString(),
                                  child: Text(controller.docPaginate[index].toString()),
                                );
                              }),
                              onChanged: (value) async {
                                controller.selectDocPaginate.value = await value.toString();
                                await controller.onRefresh();
                              }
                          ),
                          const SizedBox(width: 20)
                        ],
                      )
                    ],
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}